#!/bin/bash
# ==============================================================================
# SCRIPT: generate_icons.sh (LOCAL ASSET BUILDER - CLEAN MODE)
# PURPOSE: Fetch SVGs at build time.
# SAFETY: Wipes 'icons/' dir first to remove orphaned files.
# ==============================================================================

ICON_DIR="themes/Accessible-MD/layouts/partials/icons"

# 1. CLEANUP
echo "--- Cleaning Icon Directory ---"
if [ -d "$ICON_DIR" ]; then
    rm -f "$ICON_DIR"/*.svg
    echo "✓ Removed old SVGs."
fi
mkdir -p "$ICON_DIR"

# 2. SYSTEM ICONS (Material Symbols)
declare -A SYSTEM_ICONS=(
    ["search"]="search"
    ["menu"]="menu"
    ["close"]="close"
    ["home"]="home"
    ["articles"]="article"
    ["photos"]="photo_camera"
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
    ["event"]="event"
    ["schedule"]="schedule"
    ["styleguide"]="palette"
)

echo "--- Fetching System Icons ---"
for NAME in "${!SYSTEM_ICONS[@]}"; do
    MATERIAL_NAME="${SYSTEM_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    
    # Simple Fetch
    URL="https://raw.githubusercontent.com/google/material-design-icons/master/symbols/web/${MATERIAL_NAME}/materialsymbolsoutlined/${MATERIAL_NAME}_24px.svg"
    if curl -s -L -f "$URL" -o "$TARGET"; then
        echo "  ✓ $NAME"
    else
        echo "  X Failed to fetch $NAME"
    fi
done

# 3. SOCIAL ICONS (Simple Icons)
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

echo "--- Fetching Social Icons ---"
for NAME in "${!SOCIAL_ICONS[@]}"; do
    TARGET="$ICON_DIR/$NAME.svg"
    URL="https://cdn.simpleicons.org/$NAME" # Slug matches name
    
    if curl -s -L -f "$URL" -o "$TARGET"; then
         echo "  ✓ $NAME"
    else
         echo "  X Failed: $NAME (Creating fallback)"
         echo '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>' > "$TARGET"
    fi
done

# 4. FRIENDICA SPECIAL
TARGET="$ICON_DIR/friendica.svg"
URL="https://raw.githubusercontent.com/friendica/friendica/develop/images/friendica.svg"
if curl -s -L -f "$URL" -o "$TARGET"; then echo "  ✓ friendica"; else echo "  X Failed friendica"; fi

echo "Icon generation complete."
