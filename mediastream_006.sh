#!/bin/bash

# This script uses FFMPEG to transcode an input file to MPEG-2 and segment it
# Full description at http://macnode.com/2013/08/28/basics-of-http-live-streaming-hls/

mediaFile="/Users/macnode/Movies/wireshark.mp4"

### 480x video400kbps audio40kbps ###
mediaStreams="-map 0"
audCodec="-acodec mp2"
audKbps="-b:a 40k"
vidCodec="-bsf h264_mp4toannexb -segment_format mpegts"
vidKbps="-b:v 400k"
vidRatio="-vf scale=480:-1"
mediaSegment="-f segment -segment_time 10"
mediaPaths="-segment_list /Library/WebServer/Documents/hls/wireshark/480/_playList.m3u8 /Library/WebServer/Documents/hls/wireshark/480/movSeg_%03d.ts"
/bin/ffmpeg -i "$mediaFile" $mediaStreams $audCodec $audKbps $vidCodec $vidKbps $vidRatio $mediaSegment $mediaPaths

### 640x video1200kbps audio40kbps ###
mediaStreams="-map 0"
audCodec="-acodec mp2"
audKbps="-b:a 40k"
vidCodec="-bsf h264_mp4toannexb -segment_format mpegts"
vidKbps="-b:v 1200k"
vidRatio="-vf scale=640:-1"
mediaPaths="-segment_list /Library/WebServer/Documents/hls/wireshark/640/_playList.m3u8 /Library/WebServer/Documents/hls/wireshark/640/movSeg_%03d.ts"
mediaSegment="-f segment -segment_time 10"
/bin/ffmpeg -i "$mediaFile" $mediaStreams $audCodec $audKbps $vidCodec $vidKbps $vidRatio $mediaSegment $mediaPaths

