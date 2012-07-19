import common
import edify_generator

def DeleteFormat(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "format" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i]="""ui_print("do not formate system");"""
        elif "mount" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i]="""mount("ext4", "EMMC", "/dev/block/mmcblk0p25", "/system");
delete_recursive("/system/app", "/system/bin", "/system/customize", "/system/etc", "/system/fonts", "/system/framework", "/system/lib", "/system/media", "/system/tts", "/system/usr", "/system/xbin","/system/build.prop", "0");
mount("ext4", "EMMC", "/dev/block/mmcblk0p28", "/system/lib");"""
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
mount("ext4", "EMMC", "/dev/block/mmcblk0p28", "/system/lib");"""
    AddAssertions(info)
