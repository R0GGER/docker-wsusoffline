#!/bin/bash
if [ $UID -eq 0 ]; then
  /sbin/setuser nobody "$0" "$@"
  exit
fi

ctrlc()
{
    exit 1   # stop the script
}

trap 'ctrlc' INT

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

  if [[ $ISO == y* ]]; then
        mkdir -p /wsus/wsusoffline/client/iso
        rm -rf /wsus/wsusoffline/client/iso/*_wsusoffline-*.iso
        cd /wsus/wsusoffline/sh && ./create-iso-image.bash ${SYSTEMS} ${OFFICE} ${PARAMS} -output-path /wsus/wsusoffline/client/iso
  fi
