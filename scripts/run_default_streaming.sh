#/bin/bash

# Debugging purposes; stream only 5 sec
# vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov --sout '#standard{access=http,mux=ts,dst=:8080}' --run-time=5 vlc://quit

# Stream the hole video
vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov --sout '#standard{access=http,mux=ts,dst=:8080}' vlc://quit

