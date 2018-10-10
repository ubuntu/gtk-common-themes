#!/bin/sh

set -eux

basedir="$1"

# Don't include app and panel icons to reduce size as they aren't
# generally useful in the snap.  If an app does attempt to display
# another app's icon by it's name that could be an issue, however that's
# a corner case.
find "$basedir" -name apps -exec rm -rf {} +
find "$basedir" -name panel -exec rm -rf {} +

for dir in "$basedir"/*/; do
    if [ -f "$dir/index.theme" ]; then
        gtk-update-icon-cache -q "$dir"
    fi
done
