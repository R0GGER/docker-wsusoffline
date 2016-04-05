#!/bin/sh

for SYSTEMS in ${SYSTEMS}; do
    for LANGUAGE in ${LANGUAGE}; do
        cd /app/wsusoffline/sh && ./DownloadUpdates.sh ${SYSTEMS} ${LANGUAGE} ${PARAMS}
    done
done

for OFFICE in ${OFFICE}; do
    for LANGUAGE in ${LANGUAGE}; do
       cd /app/wsusoffline/sh && ./DownloadUpdates.sh ${OFFICE} ${LANGUAGE}
    done
done

