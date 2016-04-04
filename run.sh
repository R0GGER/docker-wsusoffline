!/bin/bash

cd /app/wsusoffline/sh && ./DownloadUpdates.sh "$SYSTEM" "$LANGUAGE" "$PARAMS"
cd /app/wsusoffline/sh && ./DownloadUpdates.sh "$OFFICE" "$LANGUAGE" "$PARAMS"
