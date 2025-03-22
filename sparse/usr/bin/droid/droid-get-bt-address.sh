#!/bin/sh

while [ "$(/usr/bin/getprop vendor.service.nvram_init)" != "Ready" ]; do
    sleep 1
done

[ -f /var/lib/bluetooth/board-address ] && exit 0

od -t x1 -An -v -w6 -N6 /mnt/vendor/nvdata/APCFG/APRDEB/BT_Addr | sed 's/^ *//; s/ /:/g' > /var/lib/bluetooth/board-address
