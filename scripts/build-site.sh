#!/bin/sh
# Build static COBOL course site from upstream at package time.
# Output: content/web/ — packaged into LPK by contentdir.
set -e

PROJECT_DIR=$(pwd)
UPSTREAM_URL="https://codeload.github.com/iamcheyan/cobol/tar.gz/refs/heads/main"
WORK_DIR=$(mktemp -d)
trap 'rm -rf "$WORK_DIR"' EXIT

echo "[build] downloading upstream cobol source..."
curl -sL --max-time 180 -o "$WORK_DIR/cobol.tar.gz" "$UPSTREAM_URL"

echo "[build] extracting..."
tar -xzf "$WORK_DIR/cobol.tar.gz" -C "$WORK_DIR"
SRC="$WORK_DIR/cobol-main"

echo "[build] preparing python venv..."
python3 -m venv "$WORK_DIR/venv"
"$WORK_DIR/venv/bin/pip" install --quiet --disable-pip-version-check 'Markdown==3.7'

echo "[build] rendering static site..."
cd "$SRC"
"$WORK_DIR/venv/bin/python" scripts/build_site.py

echo "[build] copying output to content/web/..."
rm -rf "$PROJECT_DIR/content/web"
mkdir -p "$PROJECT_DIR/content/web"
cp -r build/site/. "$PROJECT_DIR/content/web/"

echo "[build] done — $(find "$PROJECT_DIR/content/web" -type f | wc -l) files ready for packaging"
