#!/bin/bash
# ---
# PORTABLE BUILD & INDEX SCRIPT (v2)
#
# 1. [NEW] Fetches Webmentions from Webmention.io
# 2. Runs Hugo to build the site.
# 3. Runs Pagefind to index the site.
#
# This script requires a WEBMENTION_TOKEN env variable.
# ---

# --- 0. Make Script Portable ---
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

# --- 1. [NEW] Fetch Webmentions ---
echo "--- 1. Fetching Webmentions... ---"
if [ -z "$WEBMENTION_TOKEN" ]; then
  echo "Warning: WEBMENTION_TOKEN is not set. Skipping comments."
else
  curl -s "https://webmention.io/api/mentions.jf2?domain=simplygregario.us&token=$WEBMENTION_TOKEN" \
  -o "data/comments.json"
  echo "✅ Webmentions saved to data/comments.json"
fi

echo "--- 2. Building site with Hugo... ---"
hugo -D -F

echo "--- 3. Indexing site with Pagefind... ---"
npx pagefind --site "public"

echo "---"
echo "✅ Build and Search Index complete!"
echo "Your site is ready in the 'public' directory."
