#!/bin/bash
# ==============================================================================
# SCRIPT: debug_server.sh
# PURPOSE: Run Hugo in background and trap all errors to a file
# USAGE: ./debug_server.sh
# ==============================================================================

LOG_FILE="errors.txt"

# 1. Cleanup: Stop any existing Hugo servers to free up Port 1313
# We silence the output in case no server is running.
pkill hugo > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Stopped previous Hugo instance."
fi

# 2. Setup: clear the old log file so you see fresh errors only
echo "--- New Session: $(date) ---" > "$LOG_FILE"

echo "Starting Hugo Server..."

# 3. Execution:
# -D -E -F: Your standard Drafts/Expired/Future flags
# --disableFastRender: Ensures full rebuilds (slower but more accurate for errors)
# --gc: Garbage Collection (Matches your build pipeline Source [181])
# --printI18nWarnings: catch missing translation strings
# > "$LOG_FILE" 2>&1: Redirects BOTH stdout and stderr to the text file
hugo server \
  --disableFastRender \
  -D -E -F \
  --gc \
  --printI18nWarnings \
  > "$LOG_FILE" 2>&1 &

# Capture the Process ID of the last command (Hugo)
HUGO_PID=$!

echo "✅ Hugo is running in the background (PID: $HUGO_PID)."
echo "📄 Logs are being captured in '$LOG_FILE'."
echo "To stop the server, run: kill $HUGO_PID"
