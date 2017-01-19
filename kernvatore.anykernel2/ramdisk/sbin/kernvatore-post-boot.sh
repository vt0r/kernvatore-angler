#!/system/bin/sh

# for lkconfig
[ ! -d "/data/data/leankernel" ] && mkdir /data/data/leankernel
chmod 755 /data/data/leankernel

# init.d support
/system/xbin/busybox run-parts /system/etc/init.d

#
# lkconfig settings below
#

# screen_off_maxfreq
CFILE="/data/data/leankernel/screen_off_maxfreq"
SFILE="/sys/devices/system/cpu/cpu0/cpufreq/interactive/screen_off_maxfreq"
[ -f $CFILE ] && echo `cat $CFILE` > $SFILE

# rgb/picture control
SFILE="/sys/devices/platform/kcal_ctrl.0/kcal"
CFILE="/data/data/leankernel/kcal"
[ -f $CFILE ] && echo `cat $CFILE` > $SFILE
CFILE="/data/data/leankernel/kcal_sat"
[ -f $CFILE ] && echo `cat $CFILE` > ${SFILE}_sat
CFILE="/data/data/leankernel/kcal_cont"
[ -f $CFILE ] && echo `cat $CFILE` > ${SFILE}_cont
CFILE="/data/data/leankernel/kcal_hue"
[ -f $CFILE ] && echo `cat $CFILE` > ${SFILE}_hue
CFILE="/data/data/leankernel/kcal_val"
[ -f $CFILE ] && echo `cat $CFILE` > ${SFILE}_val

# wake gesture control
CFILE="/data/data/leankernel/wake_gesture"
SFILE="/sys/devices/soc.0/f9924000.i2c/i2c-2/2-0070/input/input0/wake_gesture"
[ -f $CFILE ] && echo `cat $CFILE` > $SFILE

# wlan_rx wakelock
CFILE="/data/data/leankernel/wlan_rx"
SFILE="/sys/module/bcmdhd/parameters/wl_divide"
[ -f $CFILE ] && echo `cat $CFILE` > $SFILE

# power_efficient workqueue control
CFILE="/data/data/leankernel/power_efficient"
SFILE="/sys/module/workqueue/parameters/power_efficient"
[ -f $CFILE ] && echo `cat $CFILE` > $SFILE
