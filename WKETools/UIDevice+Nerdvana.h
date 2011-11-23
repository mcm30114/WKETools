//
//  UIDevice+Hardware.h
//
//  Created by Brian Hardy on 12/29/10.
//
#import <UIKit/UIKit.h>
#include <sys/types.h>
#include <sys/sysctl.h>


@interface UIDevice (Nerdvana)

- (NSString *)platform;
- (BOOL)getPlatformName:(NSString **)name majorVersion:(int *)majorVersion minorVersion:(int *)minorVersion;

// gets a human readable hardware string, i.e. iPod 1st Gen
- (NSString*)getHardwareName;

@end
