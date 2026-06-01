#!/usr/bin/env bash
set -euo pipefail

# Function to convert a single repo's remotes
convert_repo() {
  local repo_dir="$1"
  local converted=0

  # Skip if not a valid git dir (handles bare repos & worktrees)
  if ! git -C "$repo_dir" rev-parse --git-dir &>/dev/null; then
    return
  fi

  echo "🔍 Processing: $repo_dir"

  for remote in $(git -C "$repo_dir" remote); do
    for url_type in fetch push; do
      url=$(git -C "$repo_dir" remote get-url $([[ "$url_type" == "push" ]] && echo --push) "$remote" 2>/dev/null) || continue
      [[ -z "$url" ]] && continue

      if [[ "$url" =~ ^https?:// ]]; then
        # Strip protocol
        rest="${url#*://}"
        # Strip credentials (user:pass@ or token@)
        rest="${rest#*@}"
        # Convert to SSH: host/path → host:path
        new_url="git@${rest/\//:}"

        echo "   🔄 $remote ($url_type):"
        echo "      $url"
        echo "      → $new_url"

        git -C "$repo_dir" remote set-url $([[ "$url_type" == "push" ]] && echo --push) "$remote" "$new_url"
        ((converted++))
      fi
    done
  done

  if [[ $converted -gt 0 ]]; then
    echo "   ✅ Converted $converted URL(s) in this repo"
  else
    echo "   ℹ️  No HTTP(S) remotes found"
  fi
  echo ""
}

# Main: Find all .git directories (including nested/submodule repos)
echo "🚀 Scanning for Git repositories..."
echo ""

# Handle both .git directories AND .git files (for submodules/worktrees)
while IFS= read -r -d '' git_path; do
  # Get the actual repository root
  if [[ -d "$git_path" ]]; then
    # Regular .git directory
    repo_root="$(dirname "$git_path")"
  elif [[ -f "$git_path" ]]; then
    # .git file (submodule or worktree) - extract gitdir path
    gitdir=$(grep "^gitdir:" "$git_path" | cut -d' ' -f2- | xargs)
    # If relative path, resolve from repo dir
    if [[ "$gitdir" != /* ]]; then
      gitdir="$(dirname "$git_path")/$gitdir"
    fi
    repo_root="$(dirname "$gitdir")"
  else
    continue
  fi

  convert_repo "$repo_root"
done < <(find . -name ".git" -type f -o -name ".git" -type d -print0 2>/dev/null)

echo "✨ Done scanning all repositories."
