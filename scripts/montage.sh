#!/bin/bash

# Get the list of images in the current directory
images=$(ls -v *.jpg *.png *.gif)

# Create an array of images
image_array=($images)

# Calculate the number of images
num_images=${#image_array[@]}

# Calculate the number of rows
num_rows=$((num_images/32 + 1))

# Create the montage command
montage_cmd="montage -label %f -tile 32x$num_rows"

# Add the images to the montage command
for image in "${image_array[@]}"
do
    montage_cmd="$montage_cmd $image"
done

# Execute the montage command
eval $montage_cmd montage.jpg
