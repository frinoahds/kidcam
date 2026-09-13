#!/bin/zsh
# One-shot: create public repo frinoahds/kidcam, push, enable GitHub Pages.
set -e
cd "$(dirname "$0")"
git init -q 2>/dev/null || true
git add -A && git commit -qm "kidcam v1" 2>/dev/null || true
git branch -M main
gh repo create frinoahds/kidcam --public --source=. --push -d "KidCam — kids inside emoji vehicles, live" 2>/dev/null || git push -u origin main
gh api -X POST repos/frinoahds/kidcam/pages -f build_type=legacy -f 'source[branch]=main' -f 'source[path]=/' >/dev/null 2>&1 || true
echo "LIVE in ~1 min: https://frinoahds.github.io/kidcam/"
