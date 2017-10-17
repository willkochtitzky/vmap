#! /usr/bin/env python

# this wrapper runs the velocity scripts for you to take a folder of images and output velocity maps with a stack of images including the mean, min, max of all the images

all_vmap.py *.tif > all_vmap_pairs.txt

parallel -j 4 < all_vmap_pairs.txt

mkdir velocity_output/
mv . velocity_output
#find . -maxdepth 1 -type d -exec mv . velocity_output

fnlist=$(ls velocity_output/*/*vm.tif)

make_stack.py $fnlist -outdir vel_stack_out/