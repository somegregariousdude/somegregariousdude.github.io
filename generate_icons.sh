#!/bin/bash
# ==============================================================================
# SCRIPT: generate_icons.sh (LOCAL ASSET BUILDER)
# PURPOSE: Fetch SVGs at build time and save locally.
#          - System Icons: Material Symbols
#          - Social Icons: Simple Icons + Official Repos
# ==============================================================================

ICON_DIR="themes/Accessible-MD/layouts/partials/icons"
mkdir -p "$ICON_DIR"

# 1. System Icons (Material Symbols)
declare -A SYSTEM_ICONS=(
    ["search"]="search"
    ["menu"]="menu"
    ["close"]="close"
    ["home"]="home"
    ["articles"]="article"
    ["status"]="chat_bubble"
    ["replies"]="reply"
    ["reposts"]="repeat"
    ["likes"]="favorite"
    ["bookmarks"]="bookmark"
    ["rsvps"]="event"
    ["guestbook"]="import_contacts"
    ["contact"]="mail"
    ["about"]="info"
    ["pages"]="description"
    ["categories"]="category" 
    ["tags"]="label"
    ["content_copy"]="content_copy"
    ["check"]="check"
    ["share"]="share"
)

echo "--- Updating System Icons ---"
for NAME in "${!SYSTEM_ICONS[@]}"; do
    MATERIAL_NAME="${SYSTEM_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    
    if [ ! -f "$TARGET" ]; then
        echo "Fetching System: $NAME..."
        URL="https://raw.githubusercontent.com/google/material-design-icons/master/symbols/web/${MATERIAL_NAME}/materialsymbolsoutlined/${MATERIAL_NAME}_24px.svg"
        curl -s -L -f "$URL" -o "$TARGET" || echo "  X Failed to fetch $NAME"
    fi
done

# 2. Standard Social Icons (Simple Icons CDN)
# Maps your params.toml 'icon' keys to Simple Icons slugs
# NOTE: Slugs must be lowercase (e.g. 'reddit', 'youtube')
# REMOVED: Friendica (Not reliable on Simple Icons yet)
declare -A SOCIAL_ICONS=(
    ["bluesky"]="bluesky"
    ["facebook"]="facebook"
    ["github"]="github"
    ["mastodon"]="mastodon"
    ["matrix"]="matrix"
    ["messenger"]="messenger"
    ["reddit"]="reddit"
    ["signal"]="signal"
    ["simplex"]="simplex"
    ["youtube"]="youtube"
)

echo "--- Updating Social Icons ---"
for NAME in "${!SOCIAL_ICONS[@]}"; do
    SLUG="${SOCIAL_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    
    # Force check: Try to fetch even if file exists, to ensure content is valid
    echo "Fetching Social: $NAME..."
    URL="https://cdn.simpleicons.org/$SLUG"
    
    if curl -s -L -f "$URL" -o "$TARGET"; then
         echo "  ✓ OK"
    else
         echo "  X ERROR: Could not fetch '$NAME'. Creating fallback."
         # Fallback: Empty square
         echo '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>' > "$TARGET"
    fi
done

# 3. Special Case: Friendica (Official Repo - Develop Branch)
# Simple Icons does not reliably host Friendica. We fetch from the official repo.
NAME="friendica"
TARGET="$ICON_DIR/$NAME.svg"

echo "Fetching Special: $NAME..."
# Using 'develop' branch which is the active default for assets
URL="https://raw.githubusercontent.com/friendica/friendica/develop/images/friendica.svg"

if curl -s -L -f "$URL" -o "$TARGET"; then
     echo "  ✓ OK"
else
     echo "  X ERROR: Could not fetch Friendica icon. Creating fallback."
     echo '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>' > "$TARGET"
fi

echo "Icon generation complete."
