#/bin/bash

# 30 fps
vlc -I dummy ../videos/bbb_sunflower_2160p_30fps_normal.mp4 --sout '#standard{access=http,mux=ts,dst=:8080}' vlc://quit

# 60 fps
#vlc -I dummy ../videos/bbb_sunflower_2160p_60fps_normal.mp4 --sout '#standard{access=http,mux=ts,dst=:8080}' vlc://quit

