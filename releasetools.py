import common
import edify_generator

def DeleteFormat(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "unmount(\"/system\")" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("unmount", 'ui_print')
        elif "format" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("format(\"ext4\", \"EMMC\", \"/dev/block/mmcblk0p25\", \"0\");", 'mount("ext4", "EMMC", "/dev/block/mmcblk0p25", "/system");')
        elif "mount" in edify.script[i] and "/dev/block/mmcblk0p25" in edify.script[i]:
            edify.script[i]='delete_recursive("/system/app", "/system/bin", "/system/customize", "/system/etc", "/system/fonts", "/system/framework", "/system/lib", "/system/media", "/system/tts", "/system/usr", "/system/xbin","/system/build.prop", "0");'
    return
def AddAssertions(info):
    info.script.AppendExtra('set_perm_recursive(0, 2000, 06755, 06755, "/system/xbin");');
    return 

def FullOTA_InstallEnd(info):
    AddAssertions(info)
    DeleteFormat(info)

def IncrementalOTA_InstallEnd(info):
    AddAssertions(info)
