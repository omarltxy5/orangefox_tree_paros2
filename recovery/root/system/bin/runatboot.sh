#!/system/bin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024-2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

DEBUG=0;
[ "$DEBUG" = "1" ] && set -o xtrace;

# $1=full string, $2=index number of the substring to fetch
substring() {
  echo $1 | cut -d ' ' -f $2;
}

LOGMSG() {
	echo "I:$@" >> /tmp/recovery.log
}

isloaded() {
	local f=$(lsmod | grep ^"$1");
	local c=$(substring "$f" 3);
	local c2=$(substring "$f" 4);
	if  [ -n "$c2" ] || [ -n "$c" -a "$c" != "0" ]; then
		echo "1";
	else
		echo "0";
	fi
}

quit() {
	LOGMSG "$@ is loaded";
	exit 0;
}

load_touch_drivers() {
	local path1=/vendor/lib/modules/1.1;
	local path2=/tmp/vendor/lib/modules;
	local path3=/lib/modules;
	local modules="focaltech_ts_i2c goodix_ts_9896 xiaomi_touch_game xiaomi_tp nt36672s_spi td4376_spi";

	# loop through the touch modules
	for i in $modules; do
		# check whether the module is already loaded
		f=$(isloaded "$i");
		[ "$f" = "1" ] && quit "$i"; # module is already loaded - return

		# try to load the module
		modprobe -d $path1 $i &> /dev/null;
		[ "$(isloaded $i)" = "1" ] && quit "$i";

		modprobe -d $path2 $i &> /dev/null;
		[ "$(isloaded $i)" = "1" ] && quit "$i";

		modprobe -d $path3 $i &> /dev/null;
		[ "$(isloaded $i)" = "1" ] && quit "$i";
	done
}

LOGMSG "- Running $0 on $(date)";
load_touch_drivers;
exit 0;
#
