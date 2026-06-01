#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "❌ Error: Run this inside a Git repository."
  exit 1
fi

changed=0
for remote in $(git remote); do
  for url_type in fetch push; do
    url=$(git remote get-url $([[ "$url_type" == "push" ]] && echo --push) "$remote" 2>/dev/null) || continue
    [[ -z "$url" ]] && continue

    if [[ "$url" =~ ^https?:// ]]; then
      # Strip protocol, replace first / with :
      rest="${url#*://}"
      new_url="git@${rest/\//:}"
      
      echo "🔄 $remote ($url_type):"
      echo "   $url -> $new_url"
      
      git remote set-url $([[ "$url_type" == "push" ]] && echo --push) "$remote" "$new_url"
      ((changed++))
    fi
  done
done

if [[ $changed -eq 0 ]]; then
  echo "✅ All remotes already use SSH or non-HTTP protocols."
else
  echo "✨ Successfully converted $changed URL(s) to SSH."
fi
