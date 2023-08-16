#!/bin/bash
# Based on https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/02fc52b4f02b1124f8b4718e8761491e46ff82f7/.local/share/nemo/actions/action_scripts/copy_to_admin.sh
SUCCESSSTRING="Successfully copied:"
# For each file we received
for i in "$@"; do
  # Check not overwriting an existing file or directory
  DEST="$(dirname "$i")"
  ORIG_FILE="$(basename "$i")"
  FILE="$(echo "$ORIG_FILE" | sed -E "s/[0-9]{4}-[0-9]{2}-[0-9]{2}/$(date +"%F")/g")"
  if [ -e "$DEST/$FILE" ]; then
    if ! zenity --question --icon-name=dialog-warning --width=250 --default-cancel --title="File conflict" --text="$DEST/$FILE already exists. Overwrite existing?"; then
	  NAME=$(zenity --entry --width=250 --title "File name" --text="Select an alternative file name or press cancel to abort." --entry-text="$FILE(Copy)")
      if [ -z "$NAME" ]; then
       exit 1
      fi
    else
      NAME=$FILE
    fi
  else
    NAME=$FILE
  fi
  # DEV: Silenced sudo behavior
  # Is destination under ownership of user?
  #  if [ "$DESTOWNER" != "$USER" ] ; then
  #   sudo -A -u "$DESTOWNER" cp -r  "$i" "$DEST/$NAME"
  # else
    cp -r "$i" "$DEST/$NAME"
  # fi
  cp -r "$i" "$DEST/$NAME"
  if [ $? = 1 ]; then
    zenity --info --width=250 --text="Error copying $i. Try again."
    exit 1
  else
    SUCCESSSTRING+="
    $i to $DEST/$NAME"
  fi
done
# DEV: Silenced unnecessary success notification
# notify-send "$SUCCESSSTRING"
