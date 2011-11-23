//
//  UIDevice+Hardware.m
//
//  Created by Brian Hardy on 12/29/10.
//

#import "UIDevice+Nerdvana.h"


@implementation UIDevice (Nerdvana)

- (NSString *)platform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;
}

- (BOOL)getPlatformName:(NSString **)name majorVersion:(int *)majorVersion minorVersion:(int *)minorVersion {
    NSString *platform = [self platform];
    NSScanner *scanner = [NSScanner scannerWithString:platform];
    BOOL success = NO;
    if ((success = [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:name])) {
        // now scan the major version
        if ((success = [scanner scanInt:majorVersion])) {
            // now scan the comma and minor version
            if ((success = [scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@","] intoString:NULL]))
                success = [scanner scanInt:minorVersion];
        }
    }
    return success;
}

- (NSString*)getHardwareName
{
	NSString* name;
	int majorVersion;
	int minorVersion;
	
	if ([self getPlatformName:&name majorVersion:&majorVersion minorVersion:&minorVersion])
	{
		/*
		 * iPhone Simulator == i386
		 * iPhone == iPhone1,1
		 * 3G iPhone == iPhone1,2
		 * 3GS iPhone == iPhone2,1
		 * 4 iPhone == iPhone3,1
		 * 5 iPhone == iPhone4,1
		 * 1st Gen iPod == iPod1,1
		 * 2nd Gen iPod == iPod2,1
		 * 3rd Gen iPod == iPod3,1
		 * 1st Gen iPad == iPad1,1
		 * 2nd Gen iPad == iPad2,1
		 */
		
		if ([name caseInsensitiveCompare:@"iPhone"] == 0)
		{
			if (majorVersion == 1 && minorVersion == 1)
			{
				return @"iPhone 1";
			}
			else if (majorVersion == 1 && minorVersion == 2)
			{
				return @"iPhone 3G";
			}
			else if (majorVersion == 2)
			{
				return @"iPhone 3GS";
			}
			else
			{
				return [NSString stringWithFormat:@"iPhone %d", majorVersion + 1];
			}
		}
		else if ([name caseInsensitiveCompare:@"iPad"] == 0)
		{
			return [NSString stringWithFormat:@"iPad %d", majorVersion];
		}
		else if ([name caseInsensitiveCompare:@"iPod"] == 0)
		{
			return [NSString stringWithFormat:@"iPod %d Gen", majorVersion];
		}
	}
	
	return (majorVersion == 386 ? @"Simulator" : @"Unknown");
}

@end
