#!/bin/bash
# ==============================================================================
# SCRIPT: new_post.sh
# PURPOSE: Automate content creation with dynamic directory naming (Slug vs Timestamp)
# CONTEXT: Source [156-169] - Scripting & Automation Standards
# AUTHOR: Lead Web Designer (Gemini) for Greg's Place
# ==============================================================================

# Check for arguments
if [ -z "$1" ]; then
  echo "Error: Content Type is required."
  echo "Usage: ./new_post.sh [type] \"[optional title]\""
  echo "Types: articles, photos, status, replies, reposts, likes, bookmarks, rsvps"
  exit 1
fi

TYPE=$1
TITLE=$2

# Normalize Type (remove trailing slashes if present)
TYPE=${TYPE%/}

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Validate Title Requirements
# [Source: 166] Articles & Bookmarks: Title is Required.
# [Update] Photos: Title is Optional (Snapshot mode).
# ------------------------------------------------------------------------------
if [[ "$TYPE" == "articles" || "$TYPE" == "bookmarks" ]]; then
  if [ -z "$TITLE" ]; then
    echo "Error: Title is REQUIRED for '$TYPE'."
    exit 1
  fi
fi

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Determine Directory Name
# ------------------------------------------------------------------------------

DIR_NAME=""

if [ -n "$TITLE" ]; then
  # [Source: 166, 168] If Title provided: Use slug-based directory.
  SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]/-/g' -e 's/-\+/-/g' -e 's/^-\|-$//g')
  DIR_NAME="$SLUG"
else
  # [Source: 169] If Title omitted: Use Timestamp-based directory.
  # Format: YYYY-MM-DD-HHMM
  TIMESTAMP=$(date +%Y-%m-%d-%H%M)
  DIR_NAME="$TIMESTAMP"
fi

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Execute Hugo Command
# [Source: 82] All content files must use "Leaf Bundles" (directory + index.md).
# ------------------------------------------------------------------------------

TARGET_PATH="$TYPE/$DIR_NAME/index.md"

echo "Creating new $TYPE..."
echo "Path: content/$TARGET_PATH"

# Execute Hugo new command
hugo new content "$TARGET_PATH" --kind "$TYPE"

echo "Done."
