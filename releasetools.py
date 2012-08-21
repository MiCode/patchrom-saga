import common
import edify_generator

def DeleteFormat(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "format" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i]="""ui_print("do not formate system");"""
        elif "mount" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i]="""mount("ext4", "EMMC", "/dev/block/mmcblk0p25", "/system");
package_extract_file("mount_lib.sh", "/mount_lib.sh");
run_program("/sbin/busybox", "chmod", "777", /mount_lib.sh);
run_program("/mount_lib.sh");
delete_recursive("/system/lib", "/system/app", "/system/bin", "/system/customize", "/system/etc", "/system/fonts", "/system/framework", "/system/media", "/system/tts", "/system/usr", "/system/xbin","/system/build.prop", "0");
run_program("/mount_lib.sh");
run_program("/sbin/busybox", "rm", "/system/lib/*", "-rf");"""
    return

def AddAssertions(info):
    info.script.AppendExtra('set_perm_recursive(0, 2000, 06755, 06755, "/system/xbin");');
    info.script.AppendExtra('unmount("/system/lib");')
    return

def FullOTA_InstallEnd(info):
    DeleteFormat(info)
    AddAssertions(info)

def IncrementalOTA_InstallEnd(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "mount" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i]="""mount("ext4", "EMMC", "/dev/block/mmcblk0p25", "/system");
package_extract_file("mount_lib.sh", "/mount_lib.sh");
run_program("/sbin/busybox", "chmod", "777", /mount_lib.sh);
run_program("/mount_lib.sh");"""
    AddAssertions(info)
