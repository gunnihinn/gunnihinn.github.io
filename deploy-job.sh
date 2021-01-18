#!/usr/bin/env bash

set -euo pipefail

SOURCE=/home/janitor/magnusson.io.tar.gz
ROOT=/srv/magnusson.io
LIVE_LINK="$ROOT/live"
TARGET_ROOT="$ROOT/data"
VERSIONS="$ROOT/versions.txt"

# Make sure everything exists on first run
[[ -d "$ROOT" ]] || mkdir -p "$ROOT"

sum_new=$(md5sum "$SOURCE" | cut -f 1 -d ' ')

target_old=$(readlink "$LIVE_LINK")
target_new="$TARGET_ROOT/$sum_new"

if [[ "$target_old" == "$target_new" ]]; then
    exit 0
fi

if [[ -d "$target_new" ]]; then
    rm -rf "$target_new"
fi

mkdir -p "$target_new"
tar --extract --file "$SOURCE" --directory "$target_new"

unlink "$LIVE_LINK"
ln -s "$target_new" "$LIVE_LINK"
echo "$(date) - $target_new" >> "$VERSIONS"
