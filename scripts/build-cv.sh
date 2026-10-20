#!/usr/bin/env bash
# Regenerates the CV PDF from the site's own data.
#
#   scripts/build-cv.sh                          # generic CV -> static/cv/imanol-gomez-cv.pdf
#   scripts/build-cv.sh --variant path/cv.toml   # tailored CV -> path/Imanol_Gomez_CV.pdf
#   scripts/build-cv.sh --variant path/cv.toml --out other.pdf
#
# Builds a throwaway copy of the site, serves it locally and prints /cv/print/ with
# headless Chromium. A variant is a TOML file with the same keys as data/cv.toml; it is
# copied into the throwaway copy only, so it never touches this repo (AGENTS.md rule 10).
# Needs `zola`, `chromium` (or CHROME=/path/to/chrome) and `python3`; none of them is a
# site dependency. The phone number is deliberately not in the repo (docs/PROFILE.md):
#   CV_PHONE="+49 ..." scripts/build-cv.sh
set -euo pipefail

repo=$(cd "$(dirname "$0")/.." && pwd)
variant=""
out=""
while [ $# -gt 0 ]; do
  case "$1" in
    --variant) variant=$(realpath "$2"); shift 2 ;;
    --out) out=$(realpath -m "$2"); shift 2 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
done
if [ -z "$out" ]; then
  if [ -n "$variant" ]; then out="$(dirname "$variant")/Imanol_Gomez_CV.pdf"
  else out="$repo/static/cv/imanol-gomez-cv.pdf"; fi
fi

chrome=${CHROME:-$(command -v chromium || command -v google-chrome || command -v chrome)}
port=${PORT:-1199}
tmp=$(mktemp -d)
trap 'kill "${server:-0}" 2>/dev/null || true; rm -rf "$tmp"' EXIT

# Only what Zola reads; public/ and git history stay behind.
mkdir "$tmp/src"
cp -r "$repo"/{config.toml,content,data,sass,static,templates} "$tmp/src/"
[ -n "$variant" ] && cp "$variant" "$tmp/src/data/cv-variant.toml"

# Links in the PDF point at the live site, assets at the local server.
export CV_SITE_URL=$(awk -F'"' '/^base_url/ {print $2; exit}' "$repo/config.toml")
(cd "$tmp/src" && zola build --base-url "http://127.0.0.1:$port" --output-dir "$tmp/site" --force >/dev/null)
python3 -m http.server "$port" --bind 127.0.0.1 --directory "$tmp/site" >/dev/null 2>&1 &
server=$!
sleep 1

"$chrome" --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=3000 \
  --print-to-pdf="$out" "http://127.0.0.1:$port/cv/print/" 2>/dev/null

pages=$(pdfinfo "$out" 2>/dev/null | awk '/^Pages:/ {print $2}')
echo "wrote $out (${pages:-?} pages)"
