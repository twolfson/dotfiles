# Sexy bash prompt demo
# Walks to the next directory in our list

# Save the TEST_DIR for reference
TEST_DIR=test/test-files/

# Navigate through the test directories
USE_NEXT_DIR=""
for DEMO_DIR in "" "clean-synced" "dirty" "unsynced" "dirty-unsynced" ""; do
  # If we should use this directory, navigate to it
  if test -n "$USE_NEXT_DIR"; then
    echo "Use $DEMO_DIR"
    break
  fi

  # If the current directory was the last one, mark us to use the next one
  if test "$DEMO_DIR" = "$_LAST_DEMO_DIR"; then
    USE_NEXT_DIR="1"
  fi
done

# If no directories were matching, reset _LAST_DEMO_DIR
if test -z "$USE_NEXT_DIR"; then
  echo "We couldn't find where you were in the loop. Resetting it..."
  _LAST_DEMO_DIR=""
fi