SLEEP=${SLEEP:-"$SLEEP"}

ctrlc()
{
    exit 1   # stop the script
}

trap 'ctrlc' INT

while true; do

  cd /wsus && ./update.sh
  sleep 10

  chown -R nobody:nogroup /wsus/wsusoffline
  cd /wsus && ./download.sh

  echo "Sleeping for $SLEEP before next download."
  sleep "$SLEEP"
done
