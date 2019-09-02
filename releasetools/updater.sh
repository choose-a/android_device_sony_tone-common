#!/sbin/sh
#
# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2016 The OmniROM Project
# Copyright (C) 2018 Choose-A project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e


OUTFD=1
readlink /proc/$$/fd/$OUTFD 2>/dev/null | grep /tmp >/dev/null
if [ "$?" -eq "0" ]; then
  # rerouted to log file, we don't want our ui_print commands going there
  OUTFD=0

  # we are probably running in embedded mode, see if we can find the right fd
  # we know the fd is a pipe and that the parent updater may have been started as
  # 'update-binary 3 fd zipfile'
  for FD in `ls /proc/$$/fd`; do
    readlink /proc/$$/fd/$FD 2>/dev/null | grep pipe >/dev/null
    if [ "$?" -eq "0" ]; then
      ps | grep " 3 $FD " | grep -v grep >/dev/null
      if [ "$?" -eq "0" ]; then
        OUTFD=$FD
        break
      fi
    fi
  done
fi

ui_print() {
  echo -n -e "ui_print $1\n" >> /proc/self/fd/$OUTFD
  echo -n -e "ui_print\n" >> /proc/self/fd/$OUTFD
}

succestest() {
    ui_print "#######################################"
    ui_print "### OEM Binaries Version up to date ###"
    ui_print "#######################################"
    sleep 5;
}

failtest() {
    ui_print "#######################################"
    ui_print "#  PLEASE BEWARE YOU DONOT HAVE THE   #"
    ui_print "#  (CURRENT) OEM BINARIES VERSION     #"
    ui_print "#  INSTALLED!                         #"
    ui_print "#=====================================#"
    ui_print "#  NOT HAVING THIS INSTALLED COULD    #"
    ui_print "#  CAUSE UNEXPECTED AND UNWANTED      #"
    ui_print "#  BEHAVIOUR. GET YOUR COPY OF THE    #"
    ui_print "#  LATEST OEM BINARIES AT:            #"
    ui_print "#  https://developer.sony.com/deve    #"
    ui_print "#  lop/open-devices/guides/aosp-bu    #"
    ui_print "#  ild-instructions                   #"
    ui_print "#  AND FOLLOW INSTRUCTIONS ON LINKED  #"
    ui_print "#  PAGES. ALTERNATIVELY CHECK THE     #"
    ui_print "#  README THAT IS INCLUDED IN THE     #"
    ui_print "#  ZIP YOU ARE INSTALLING THIS        #"
    ui_print "#  ROM FROM                           #"
    ui_print "#######################################"
    sleep 5;
}

# check mounts
check_mount() {
    local MOUNT_POINT=$(readlink "${1}");
    if ! test -n "${MOUNT_POINT}" ; then
        # readlink does not work on older recoveries for some reason
        # doesn't matter since the path is already correct in that case
        echo "Using non-readlink mount point ${1}";
        MOUNT_POINT="${1}";
    fi
    if ! grep -q "${MOUNT_POINT}" /proc/mounts ; then
        mkdir -p "${MOUNT_POINT}";
        if ! mount -t "${3}" "${2}" "${MOUNT_POINT}" ; then
             echo "Cannot mount ${1} (${MOUNT_POINT}).";
             exit 1;
        fi
    fi
}

# check partitions
check_mount /lta-label /dev/block/bootdevice/by-name/LTALabel ext4;
check_mount /odm /dev/block/bootdevice/by-name/oem ext4;
check_mount /system /dev/block/bootdevice/by-name/system ext4;
# Check the vendor firmware version flashed on ODM
expectedoem=$(\
    cat /system/build.prop | \
    grep ro.odm.expect.version | \
    sed s/.*=// \
);

oemversion=$(\
    cat /odm/build.prop | \
    grep ro.odm.version | \
    sed s/.*=// \
);

setvariant=$(\
    cat /odm/build.prop | \
    grep ro.sony.variant | \
    sed s/.*=// \
);

if [[ "$oemversion" == "$expectedoem" ]]
then
    succestest
else
    failtest
fi

ui_print
ui_print "Current Oem Binaries version: ${oemversion}"
ui_print "Expected Oem Binaries version: ${expectedoem}"

# Detect the exact model from the LTALabel partition
# This looks something like:
# 1284-8432_5-elabel-D5303-row.html
variant=$(\
    ls /lta-label/*.html | \
    sed s/.*-elabel-// | \
    sed s/-.*.html// | \
    tr -d '\n\r' | \
    tr '[a-z]' '[A-Z]' \
);

ui_print "Device variant: ${variant}";

# Set the variant as a prop
if [[ "$setvariant" == "$variant" ]]
then
    ui_print "Variant already set!"
else
    $(echo "ro.sony.variant=${variant}" >> /odm/build.prop);
    chmod 0644 /odm/build.prop;
fi
exit 0
