#/bin/bash

# Go to videos directory
cd ../videos

# Download BBB film as a testing video
# Old Film release
# wget https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_h264.mov

# New Film release
# 30 fps 
wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_2160p_30fps_normal.mp4.zip
wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_1080p_30fps_normal.mp4.zip 

# 60 fps
# wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_2160p_60fps_normal.mp4.zip  
# wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_1080p_60fps_normal.mp4.zip  

# Unzip
unzip '*.zip'
