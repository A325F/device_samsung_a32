#! /vendor/bin/sh

if [ "$#" -ne 1 ]
then
    echo "Usage: $0 <hdm_status value>"
    exit
fi

count=0
policy=0
array=(1 2 4 8 16 32 64 128 256 512)
name_arry=(cam mmc usb wlan bt gps dis aud cpm sen)


hdm_status=$1
hdm_swblock_status=$(getprop "ro.vendor.hdm.supported.swblock")

echo "hdmstatus = $hdm_status"
echo "hdm supported swblock = $hdm_swblock_status"

HDM_STATUS_SPLIT=$(echo $hdm_status | tr "&|" "\n")

#get hdm policy from ro.boot.hdm_status
for split in $HDM_STATUS_SPLIT
do
    count=$((($count + 1)%2))
    if [ $count -eq 0 ]; then
        split16="0x$split"
        echo "split16 = $split16"
        policy=$(($policy|$split16))
    fi
done

echo "$policy"
hex=$(printf "0x%x" "$policy")
echo "$hex"

#setprop vendor.hdm.status "$hex"

#check sw block
swblock=$(($policy&$hdm_swblock_status))
swblockhex=$(printf "0x%x" "$swblock")
echo "swblockhex = $swblockhex"

setprop vendor.hdm.swblock.status "$swblockhex"

#start sw block
count=0
for isblock in ${array[@]}
do
    if [ $(($isblock&$swblock)) -eq $isblock ]; then
        echo "swblock enable = ${name_arry[$count]}"
        swblockname=$(printf "vendor.hdm.internal.%s" "${name_arry[$count]}")
        setprop $swblockname "boot"
    fi
    count=$(($count + 1))
done

