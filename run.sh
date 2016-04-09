#!/bin/sh

# temp fix for hashdeep error wsusoffline 10.6.1
rm -rf /app/wsusoffline/client/md

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

