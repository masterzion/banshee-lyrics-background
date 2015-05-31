#!/bin/bash

LAST=""
while true; do 
   if (("$(banshee --query-position | cut -d " " -f2- | cut -d "." -f1)" < "2")) ; then
       TITLE=$(banshee banshee --query-title | cut -d ' ' -f2- |  tr -d "'"  )
       ARTIST=$(banshee --query-artist | cut -d ' ' -f2- |  tr -d "'" )
       CURRENT="$ARTIST: $TITLE"

       echo $CURRENT

       if [[ "$LAST" != "$CURRENT" ]]; then
         clear
         songtext  -t $TITLE -a $ARTIST
         LAST=$CURRENT
       fi
   else
     sleep 2
   fi

done



