!/bin/bash

SYSTEM=${SYSTEM:-"all-x64"}
LANGUAGE=${LANGUAGE:-"enu"}
PARAMS=${PARAMS:-"/msse /dotnet"}
SLEEP=${SLEEP:-"48h"}

ctrlc()
{
    exit 1   # stop the script
}

trap 'ctrlc' INT

while true; do
    cd /app/wsusoffline/sh && ./DownloadUpdates.sh "$SYSTEM" "$LANGUAGE" "$PARAMS"
    echo "Sleeping for $SLEEP before next download."
    sleep "$SLEEP"
done
