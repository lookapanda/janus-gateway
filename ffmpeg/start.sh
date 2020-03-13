#!/bin/sh
# while :
# do
# ffmpeg -re -i "${VIDEO}"  \
    # -filter_complex "\
    # [0]drawtext=text='1000k':x=(w-text_w-10):y=10:fontfile=bebas.ttf:fontsize=300:fontcolor=white[out1];\
    # [0]drawtext=text='1500k':x=(w-text_w-10):y=10:fontfile=bebas.ttf:fontsize=300:fontcolor=white[out2];\
    # [0]drawtext=text='2000k':x=(w-text_w-10):y=10:fontfile=bebas.ttf:fontsize=300:fontcolor=white[out3]\
    # " \
#     -bsf:v h264_mp4toannexb \
#     -map '[out1]' \
#     -c:v libx264 \
#     -an \
#     -dn \
#     -sn \
#     -b:v 1000k \
#     -r 30 \
#     -g 30 \
#     -preset medium \
#     -profile:v baseline -level 3.1 \
#     -f rtp -payload_type 126 "rtp://${HOST}:7020?pkt_size=1316" \
#     -map '[out2]' \
#     -c:v libx264 \
#     -an \
#     -dn \
#     -sn \
#     -b:v 1500k \
#     -r 30 \
#     -g 30 \
#     -preset medium \
#     -profile:v baseline -level 3.1 \
#     -f rtp -payload_type 126 "rtp://${HOST}:7022?pkt_size=1316" \
#     -map '[out3]' \
#     -c:v libx264 \
#     -an \
#     -dn \
#     -sn \
#     -b:v 2000k \
#     -r 30 \
#     -g 30 \
#     -preset medium \
#     -profile:v baseline -level 3.1 \
#     -f rtp -payload_type 126 "rtp://${HOST}:7024?pkt_size=1316"
# done;

ffmpeg -re -i "${VIDEO}" \
    -map 0 \
    -s 1920x800 \
    -c:a libopus \
    -c:v libx264 \
    -b:v 1000k \
    -r 30 \
    -g 30 \
    -preset veryfast \
    -profile:v baseline \
    -level 3.1 \
    -f tee "[select=\'v:0\':f=rtp]rtp://${HOST}:7020?pkt_size=1316|[select=\'a:0\':f=rtp]rtp://${HOST}:7022?pkt_size=1316"
# done;