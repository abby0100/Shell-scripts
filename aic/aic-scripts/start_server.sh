#!/bin/bash

exec 1>> log.txt
exec 2>> log.txt

echo "600000" > /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max
echo "2560" > /proc/sys/fs/inotify/max_user_instances
echo "280224" > /proc/sys/kernel/pid_max
echo "1" > /sys/kernel/mm/ksm/run
echo "1000" > /sys/kernel/mm/ksm/sleep_millisecs
echo "1000" > /sys/kernel/mm/ksm/pages_to_scan
ulimit -n 4096

mkdir -p rootdir
mkdir -p system
mkdir -p ipc
mkdir -p data

#insmod /hd2/back/kernel/kernel-multi-binder/android_multi_instance/ashmem/ashmem_module.ko
#insmod /hd2/back/kernel/kernel-multi-binder/android_multi_instance/binder/binder_module.ko

#insmod /home/binyang/yuan/work_dir/driver/ashmem/ashmem_module.ko
#insmod /home/binyang/yuan/work_dir/driver/binder/binder_module.ko

umount ./system
umount ./rootdir

echo "mount system and rootdir"
mount android.img ./rootdir
mount system.img ./system



echo "set up network interface"
export HOST_IFACE=eno2
export CLIENT_IFACE=eth0
# disable network
export HOST_IFACE=invalid_iface

./container_server
