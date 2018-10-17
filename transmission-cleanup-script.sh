#!/bin/sh

  TORRENTLIST_COMPLETE=`/usr/local/bin/transmission-remote  -n <login>:<password> -l | grep 100 | grep "Stopped\|Finished\|Idle" | cut -c 1-5 -c 71-`

  for TORRENT_COMPLETE in $TORRENTLIST_COMPLETE
  do
    echo "Removing torrent ID# $TORRENT_COMPLETE"
    TORRENT_ID=`echo $TORRENT_COMPLETE | awk '{ print $1 }'`
    /usr/local/bin/transmission-remote -n <login>:<password> -t $TORRENT_ID -r
  done
