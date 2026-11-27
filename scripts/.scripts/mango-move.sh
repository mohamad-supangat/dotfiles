#!/bin/sh
set -eu

direction="${1:-}"
case "$direction" in
left | right | up | down) ;;
*)
  echo "Usage: $0 {left|right|up|down}" >&2
  exit 1
  ;;
esac

command -v jq >/dev/null 2>&1 || {
  echo "jq tidak ditemukan" >&2
  exit 1
}

focus_json="$(mmsg get focusing-client)"
[ -n "$focus_json" ] && [ "$focus_json" != "null" ] || exit 0

monitor="$(printf '%s' "$focus_json" | jq -r '.monitor // empty')"
is_floating="$(printf '%s' "$focus_json" | jq -r '.is_floating // false')"
echo $is_floating
[ -n "$monitor" ] || exit 0

active_layout="$(mmsg get all-tags | jq -r --arg mon "$monitor" '
  .all_tags[]
  | select(.monitor == $mon)
  | .tags[]
  | select(.is_active == true)
  | .layout
' | head -n1)"

if [ -n "$active_layout" ] && [ "$active_layout" != "M" ]; then
  mmsg dispatch "move_client,${direction}"
fi

# mmsg dispatch "togglegroupbar"

if [ "$is_floating" = "true" ]; then
  echo is_floating
  case "$direction" in
  left) offset="-20,+0" ;;
  right) offset="+20,+0" ;;
  up) offset="+0,-20" ;;
  down) offset="+0,+20" ;;
  esac
  mmsg dispatch "movewin,${offset}"
fi
