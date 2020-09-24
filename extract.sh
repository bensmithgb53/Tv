#!/bin/bash
httrack http://mathanosto.top/tv/
cd mathanosto.top/tv
echo "" > IPTV.m3u
echo "#EXTM3U" >> IPTV.m3u
i=1
for x in [player]*.html; do
  var=$(cat $x | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*.&amp" | head -1 ; echo "\n")
  echo "#EXTINF:-1, Channel $i" >> IPTV.m3u
  echo $var >> IPTV.m3u
  i=$((i+1))
done

cp IPTV.m3u ../../
