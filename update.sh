#!/bin/bash

# Set time
echo "${TIMEZONE}" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
 
# Go to script's path as a start:
BASEPATH="$(pwd)/wsusoffline"
if [ ! -d /temp ]; then
   mkdir /temp
fi
wget --timestamping --directory-prefix="static" \
    "http://download.wsusoffline.net/StaticDownloadLink-recent.txt"

diff --strip-trailing-cr \
    "static/StaticDownloadLink-this.txt" \
    "static/StaticDownloadLink-recent.txt" > /dev/null

if (( $? == 0 )); then
    echo "The installed version of WSUS Offline Update is up-to-date."
    exit 0;
else
    URL=$(cat static/StaticDownloadLink-recent.txt) 
    echo We need to update wsusoffline!
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
                cp -av temp/wsusoffline/* "$BASEPATH"
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
fi
cd $BASEPATH
# cleanup 
if [ -d /temp ]; then
   rm -rf /temp
fi
# if you have to set file permissions uncomment some out
# find ../ -type d -print0 | xargs -0 chmod 755
# find ../ -type f -print0 | xargs -0 chmod 644
# chown -R nobody.nogroup ../
#
# make the shell scripts executabal again
find ../ -name '*.sh' -print0 | xargs -0 chmod +x

