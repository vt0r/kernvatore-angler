# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Kernvatore v3.0 by vt0r @ xda-developers
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

# end ramdisk changes

write_boot;

## end install

