#!/bin/bash

SLEEP=${SLEEP:-"$SLEEP"}

ctrlc()
{
    exit 1   # stop the script
}

trap 'ctrlc' INT

while true; do

cd /wsus && ./update.sh
sleep 10

  for SYSTEMS in ${SYSTEMS}; do
    for LANGUAGE in ${LANGUAGE}; do
        cd /wsus/wsusoffline/sh && ./download-updates.bash ${SYSTEMS} ${LANGUAGE} ${PARAMS}
    done
  done

  for OFFICE in ${OFFICE}; do
    for LANGUAGE in ${LANGUAGE}; do
        cd /wsus/wsusoffline/sh && ./download-updates.bash ${OFFICE} ${LANGUAGE}
    done
  done
  echo "Sleeping for $SLEEP before next download."
  sleep "$SLEEP"
done
