# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Kernvatore v3.11 by vt0r @ xda-developers
do.devicecheck=1
do.initd=0
do.modules=0
do.cleanup=1
device.name1=angler

# shell variables
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.angler.rc
insert_line init.angler.rc "init.kernvatore.rc" after "import init.angler.sensorhub.rc" "import init.kernvatore.rc";
remove_section init.angler.rc "# Load persistent dm-verity state" "verity_load_state"
remove_section init.angler.rc "# Setup zram options" "write /sys/block/zram0/max_comp_streams 4"
remove_section init.angler.rc "# Update dm-verity state and set partition.*.verified properties" "verity_update_state"

# fstab.angler
#insert_line fstab.angler "data           f2fs" after "data           ext4" "/dev/block/platform/soc.0/f9824900.sdhci/by-name/userdata     /data           f2fs    rw,nosuid,nodev,noatime,nodiratime,inline_xattr wait,formattable,encryptable=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata";
#insert_line fstab.angler "cache          f2fs" after "cache          ext4" "/dev/block/platform/soc.0/f9824900.sdhci/by-name/cache        /cache          f2fs    rw,nosuid,nodev,noatime,nodiratime,inline_xattr wait,check,formattable";
patch_fstab fstab.angler /system ext4 flags ",verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata" "";
patch_fstab fstab.angler /vendor ext4 flags ",verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata" "";
### Uncomment the following line to disable encryption enforcement
patch_fstab fstab.angler /data ext4 flags "forcefdeorfbe" "encryptable";
remove_line fstab.angler "/dev/block/zram0"

# end ramdisk changes

write_boot;

## end install

