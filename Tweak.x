#import <Foundation/Foundation.h>
#include <stdlib.h>

%hook NSFileManager
- (BOOL)fileExistsAtPath:(id)path {
    NSArray *detectedFiles = [NSArray arrayWithObjects:@"User/Applications/",
                                                     @"/Applications/Cydia.app",
                                                     @"/private/var/lib/apt/",
                                                     @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                                                     @"/bin/bash",
                                                     @"/etc/apt",
                                                     @"/usr/bin/ssh",
                                                     @"/private/var/lib/apt",
                                                     @"/private/var/lib/cydia",
                                                     @"/private/var/tmp/cydia.log",
                                                     @"/Applications/WinterBoard.app",
                                                     @"/var/lib/cydia",
                                                     @"/private/etc/dpkg/origins/debian",
                                                     @"/bin.sh",
                                                     @"/private/etc/apt",
                                                     @"/etc/ssh/sshd_config",
                                                     @"/private/etc/ssh/sshd_config",
                                                     @"/Applications/SBSetttings.app",
                                                     @"/private/var/mobileLibrary/SBSettingsThemes/",
                                                     @"/private/var/stash",
                                                     @"/usr/libexec/sftp-server",
                                                     @"/usr/libexec/cydia/",
                                                     @"/usr/sbin/frida-server",
                                                     @"/usr/bin/cycript",
                                                     @"/usr/local/bin/cycript",
                                                     @"/usr/lib/libcycript.dylib",
                                                     @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                                                     @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                                                     @"/Applications/FakeCarrier.app",
                                                     @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                                                     @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                                                     @"/usr/libexec/ssh-keysign",
                                                     @"/Applications/blackra1n.app",
                                                     @"/Applications/IntelliScreen.app",
                                                     @"/Applications/Snoop-itConfig.app",
                                                     @"/var/checkra1n.dmg",
                                                     @"/var/binpack",
                                                     @"/bin/sh",
                                                     @"/Applications/Cydia.app/",
                                                     nil];
  for (NSString *file in detectedFiles) {
    if ([path isEqualToString:file]) return NO;
  }
  return %orig(path);
}
%end
%hookf(char *, getenv, const char *env) {
    if (strcmp(env, "DYLD_INSERT_LIBRARIES") == 0) {
        return NULL;
    }
    return %orig(env);
}
