#/bin/bash

# Debugging purposes; stream only 5 sec
#vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov --sout '#transcode{vcodec=h264,acodec=mp3,ab=128,channels=2,samplerate=44100}:http{mux=ffmpeg{mux=flv},dst=:8080/}' --run-time=5 vlc://quit

# Stream the hole video
#vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov --sout '#transcode{vcodec=h264,acodec=mp3,ab=128,channels=2,samplerate=44100}:http{mux=ffmpeg{mux=flv},dst=:8080/}' vlc://quit

#vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov --sout '#transcode{vcodec=h264,acodec=mp3,ab=256,channels=2,samplerate=44100}:http{mux=ffmpeg{mux=flv},dst=:8080/}' vlc://quit

# Transcoding the video and audio streams. Increasing bit rate.
#vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov --sout '#transcode{vcodec=h264,vb=8000,acodec=mp3,ab=256,channels=2,samplerate=44100}:http{mux=ffmpeg{mux=flv},dst=:8080/}' vlc://quit

# Transcoding to H.264 with a high video bitrate (vb=10000 kb/s).
# Upscaling the video (scale=2), which increases the processing needed.
# Audio transcoding to FLAC (acodec=flac) with a high bitrate (ab=320 kb/s), increasing audio quality and processing requirements.
# Applying filters like deinterlacing, audio-sync, adjusting contrast and brightness, which require additional memory for processing frames before streaming.
vlc -I dummy ../videos/big_buck_bunny_1080p_h264.mov \
--sout '#transcode{vcodec=h264,vb=10000,scale=2,acodec=flac,ab=320,channels=2,samplerate=48000,deinterlace,audio-sync,canvas-aspect=16:9,video-filter=adjust{contrast=2.0,brightness=1.5}}:http{mux=ffmpeg{mux=flv},dst=:8080/}' \
vlc://quit

