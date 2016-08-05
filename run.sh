#!/bin/sh

## SIMLINK
# ln -s /wsus/run.sh /etc/my_init.d/run.sh
# ln -s /wsus/run.sh /etc/cron.weekly/run.sh

#WSUS="/wsus"
#SYSTEMS="all-61 all-63 all-100"
#OFFICE="o2k13 o2k16"
#LANGUAGE="nld"
#PARAMS="/dotnet /msse /wddefs /wle /makeiso"
#CRON="weekly"

cd $WSUS/ && ./update.sh
sleep 10

for SYSTEMS in ${SYSTEMS}; do
    for LANGUAGE in ${LANGUAGE}; do
        cd $WSUS/wsusoffline/sh && ./DownloadUpdates.sh ${SYSTEMS} ${LANGUAGE} ${PARAMS}
    done
done

for OFFICE in ${OFFICE}; do
    for LANGUAGE in ${LANGUAGE}; do
       cd $WSUS/wsusoffline/sh && ./DownloadUpdates.sh ${OFFICE} ${LANGUAGE}
    done
done


