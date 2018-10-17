![Transmission_logo](Transmission-Logo.png)
# transmission-cleanup-script

## Description
> Cleanup your transmission torrent client automatically when torrent is done,seeded...

transmission-cleanup-script.sh
```bash
  #!/bin/sh

  TORRENTLIST_COMPLETE=`/usr/local/bin/transmission-remote  -n <login>:<password> -l | grep 100 | grep "Stopped\|Finished\|Idle" | cut -c 1-5 -c 71-`

  for TORRENT_COMPLETE in $TORRENTLIST_COMPLETE
  do
    echo "Removing torrent ID# $TORRENT_COMPLETE"
    TORRENT_ID=`echo $TORRENT_COMPLETE | awk '{ print $1 }'`
    /usr/local/bin/transmission-remote -n <login>:<password> -t $TORRENT_ID -r
  done
```

:heavy_check_mark: Precise your transmission credentials on the script if needed

## Usage with a CronTab
> I'm using it on my NAS with [SickRage](https://github.com/SiCKRAGE/SiCKRAGE) torrent auto-download

CronTab set
```bash
crontab -e
0 1 * * * <mypath>/transmission-cleanup-script.sh
```
