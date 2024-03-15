#/bin/bash

# Go to videos directory
cd ../videos

# Download
wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_2160p_30fps_normal.mp4.zip  
wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_2160p_60fps_normal.mp4.zip  
wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_1080p_60fps_normal.mp4.zip  
wget https://download.blender.org/demo/movies/BBB/bbb_sunflower_1080p_30fps_normal.mp4.zip 

# Unzip
unzip '*.zip'
