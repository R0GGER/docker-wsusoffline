#!/bin/bash

# Go to script's path as a start:
cd "$(dirname "$0")"
BASEPATH=$(pwd)/wsusoffline
if [ ! -d /temp ]; then
   mkdir /temp
fi
wget --timestamping --directory-prefix="static" \
    "http://download.wsusoffline.net/StaticDownloadLink-recent.txt"

diff --strip-trailing-cr \
    "static/StaticDownloadLink-this.txt" \
    "static/StaticDownloadLink-recent.txt" > /dev/null

URL=$(cat static/StaticDownloadLink-recent.txt)
echo Updating wsusoffline...
cd /temp/
wget -q $URL
HASH=$(echo $URL |sed 's/\.zip/_hashes.txt/')
wget -q $HASH
FILE=$(echo $URL |sed 's/http:\/\/download.wsusoffline.net\///')
HASH=$(echo $FILE|sed 's/\.zip/_hashes.txt/')

if [[ -f $FILE ]]; then
    SHA256=$(sha256sum /temp/$FILE | awk '{print $1}')
        if [[ $(grep -c "$SHA256,$FILE" $HASH) -gt 0 ]]; then
            echo Download validated
            cd /temp/
            if [[ -d wsusoffline ]]; then
                rm -r wsusoffline
            fi
            unzip -q $FILE
            cd ..
            cp -av /temp/wsusoffline/* "$BASEPATH"
            else
                    echo Download failed
                    if [[ -f /temp/$FILE ]]; then
                            rm -v /temp/$FILE
                    fi
                    if [[ -f /temp/$HASH ]]; then
                            rm -v /temp/$HASH
                    fi
                    if [[ -d /temp/wsusoffline ]]; then
                            rm -r /temp/wsusoffline/
                    fi
        fi
fi

cd $BASEPATH
# cleanup
if [ -d /temp ]; then
   rm -rf /temp
fi

# make the shell scripts executabal again
find ../ -name '*.bash' -print0 | xargs -0 chmod +x
find ../ -name '*.sh' -print0 | xargs -0 chmod +x
cp -rf /wsus/preferences.bash /wsus/wsusoffline/sh/preferences.bash
