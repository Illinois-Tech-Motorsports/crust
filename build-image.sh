#!/bin/bash

# Use -N to skip downloads, use -L to skip downloads and clean recompile kernel
if [ "$#" -eq 0 ] || [ "$1" != "-N" ] && [ "$1" != "-L" ]; then
    git clone git://git.buildroot.org/buildroot
    mv buildroot* buildroot
    wget -N https://github.com/raspberrypi/firmware/raw/master/boot/bcm2711-rpi-cm4.dtb -P buildroot/output/images/
    wget -N https://github.com/raspberrypi/firmware/raw/master/boot/bootcode.bin -P buildroot/output/images/
    wget -N https://github.com/raspberrypi/firmware/raw/master/boot/start4.elf -P buildroot/output/images/
    wget -N https://github.com/raspberrypi/firmware/raw/master/boot/fixup4.dat -P buildroot/output/images/
fi

make -C buildroot defconfig BR2_DEFCONFIG=../crust_config && \
if [ "$#" -eq 0 ] || [ "$1" != "-L" ]; then
    make -j $(nproc) -C linux-dirclean
fi
make -j $(nproc) -C buildroot && \
yes | mv -f buildroot/output/images/sdcard.img . && \
echo "Image built at $(pwd)/sdcard.img"
