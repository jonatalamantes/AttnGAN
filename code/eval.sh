#!/bin/bash

counter=0
GPU=6

while [ $counter -lt 602 ]; do

    sed -i "s@.*NET_G.*@    NET_G: '../final/netG_epoch_$counter.pth'@g" cfg/eval_anime_wb2.yml
    python main.py --cfg cfg/eval_anime_wb2.yml --gpu $GPU
    counter=$((counter+50))

done

sed -i "s@.*NET_G.*@    NET_G: '../final/netG_epoch_601.pth'@g" cfg/eval_anime_wb2.yml
python main.py --cfg cfg/eval_anime_wb2.yml --gpu $GPU


# end of file
