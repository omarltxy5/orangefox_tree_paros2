#!/system/bin/sh
#
# Copyright (C) 2024-2025 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

setdevicename() {
    resetprop "ro.product.name" "$1";
    resetprop "ro.build.product" "$1";
    resetprop "ro.vendor.product.device" "$1";
    resetprop "ro.system.product.device" "$1";
    resetprop "ro.system_ext.product.device" "$1";
    resetprop "ro.odm.product.device" "$1";
    resetprop "ro.product.device" "$1";
    resetprop "ro.product.product.device" "$1";
    resetprop "ro.product.bootimage.device" "$1";
    resetprop "ro.product.odm.device" "$1";
    resetprop "ro.product.system.device" "$1";
    resetprop "ro.product.system_ext.device" "$1";
    resetprop "ro.product.vendor.device" "$1";
    resetprop "ro.product.board" "$1";
}

setdevicemodel() {
    resetprop "ro.product.model" "$1";
    resetprop "ro.product.vendor.model" "$1";
    resetprop "ro.product.odm.model" "$1";
    resetprop "ro.product.system.model" "$1";
    resetprop "ro.product.system_ext.model" "$1";
    resetprop "ro.product.product.model" "$1";
}

process_device() {
	local devicemodel;
	local dev_desc;
	local dev=$(getprop "ro.boot.hwname");

	case "$dev" in
	topaz)
		devicemodel="23021RAA2Y";
		dev_desc="Redmi Note 12 4G NFC";
	;;
	tapas)
		devicemodel="23021RAAEG";
		dev_desc="Redmi Note 12 4G";
	;;
	sapphiren)
		devicemodel="23124RA7EO";
		dev_desc="Xiaomi Redmi Note 13 4G";
	;;
	sapphire)
		devicemodel="23129RAA4G";
		dev_desc="Xiaomi Redmi Note 13 4G";
	;;
	creek)
		devicemodel="25062RN2DL";
		dev_desc="Redmi 15 4G/POCO M7 4G";
	;;
	*)
		devicemodel="23021RAAEG";
		dev_desc="Redmi Note 12 4G";
		dev="tapas";
	;;
	esac

	setdevicename "$dev";
	setdevicemodel "$devicemodel";
	resetprop "ro.display.series" "$dev_desc";
	resetprop "ro.product.bootimage.model" "$dev_desc";
}


#
process_device;
exit 0;
#
