#!/bin/bash
# ==============================================================================
# SCRIPT: generate_icons.sh (STABILITY MODE)
# PURPOSE: Fetch essential SVGs.
#          - Social Links are now Text-Only (no icons needed).
#          - Mastodon Shortcode STILL NEEDS mastodon.svg.
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
)

echo "--- Updating System Icons ---"
for NAME in "${!SYSTEM_ICONS[@]}"; do
    MATERIAL_NAME="${SYSTEM_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    
    if [ ! -f "$TARGET" ]; then
        echo "Fetching $NAME..."
        URL="https://raw.githubusercontent.com/google/material-design-icons/master/symbols/web/${MATERIAL_NAME}/materialsymbolsoutlined/${MATERIAL_NAME}_24px.svg"
        
        if curl -s -L -f "$URL" -o "$TARGET"; then
             echo "  ✓ OK"
        else
             echo "  X ERROR: Could not fetch '$MATERIAL_NAME'."
             rm -f "$TARGET"
        fi
    fi
done

# 2. Essential Brand Icons (Manual List)
# We only fetch what is strictly required by Shortcodes/Layouts.
# We skip the social loop to avoid CI failures.

MASTODON_TARGET="$ICON_DIR/mastodon.svg"
if [ ! -f "$MASTODON_TARGET" ]; then
    echo "Fetching Essential Brand: Mastodon..."
    # Use Simple Icons CDN as primary, fallback to raw if needed
    if curl -s -L -f "https://cdn.simpleicons.org/mastodon" -o "$MASTODON_TARGET"; then
        echo "  ✓ OK"
    else
        echo "  X Failed to fetch Mastodon icon."
        # Create blank to prevent build crash
        echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/></svg>' > "$MASTODON_TARGET"
    fi
fi

echo "Icon generation complete."
