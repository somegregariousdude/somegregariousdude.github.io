#!/bin/bash
# ---
# PORTABLE BUILD & INDEX SCRIPT
#
# 1. Runs Hugo to build the site into the 'public' folder.
# 2. Runs Pagefind on that 'public' folder to
#    generate the search index and JS files.
# ---

# --- 0. Make Script Portable ---
# Get the directory this script is running from
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Change to that directory
cd "$SCRIPT_DIR"

echo "--- 1. Building site with Hugo... ---"
hugo -D -F

echo "--- 2. Indexing site with Pagefind... ---"
npx pagefind --site "public"

echo "---"
echo "✅ Build and Search Index complete!"
echo "Your site is ready in the 'public' directory."
