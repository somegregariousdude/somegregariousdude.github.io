#!/bin/bash
# ---
# PORTABLE BUILD & INDEX SCRIPT (v3)
#
# 1. Runs Hugo to build the site.
# 2. Runs Pagefind to index the site.
# (Webmention/Cactus steps have been REMOVED)
# ---

# --- 0. Make Script Portable ---
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

echo "--- 1. Building site with Hugo... ---"
hugo -D -F

echo "--- 2. Indexing site with Pagefind... ---"
npx pagefind --site "public"

echo "---"
echo "✅ Build and Search Index complete!"
echo "Your site is ready in the 'public' directory."
