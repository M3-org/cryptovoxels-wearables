#!/bin/bash

# Create a directory to store the output images
mkdir output

# Create a counter to keep track of the row number
row=1

# Loop through the images from 1 to 1000
for i in {1..1000}
do
    # Create a variable to store the images for the current row
    row_images=""

    # Loop through the images from the current row
    for j in $(seq $i $(($i+31)))
    do
        # Add the image to the row_images variable
        row_images="$row_images model-$j.png"
    done

    # Combine the images horizontally
    convert $row_images +append output/row-$row.jpg

    # Increment the row counter
    row=$(($row+1))

    # Increment the image counter
    i=$(($i+32))
done

# Combine the rows into a video
ffmpeg -framerate 10 -pattern_type glob -i 'output/*.jpg' -c:v libx264 -pix_fmt yuv420p out.mp4

