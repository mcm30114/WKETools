//
//  NSObject+BlockAdditions.m
//  Bongiovi
//
//  Created by Michael L. Ward on 4/29/11.
//  Copyright 2011 Big Nerd Ranch. All rights reserved.
//

#import "NSFileManager+Nerdvana.h"

@implementation NSFileManager (Nerdvana)

+ (NSString *)documentsDirectory
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [documentDirectories objectAtIndex:0];
}
+ (NSString *)pathInDocumentsDirectory:(NSString *)filename
{
    return [[self documentsDirectory] stringByAppendingPathComponent:filename];
}

+ (NSString *)privateDocumentsDirectory
{
    NSArray *libdirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *dir = nil;
    if (libdirs.count > 0) {
        dir = [[libdirs objectAtIndex:0] stringByAppendingPathComponent:@"Private Documents"];
    }
    return dir;
}
+ (NSString *)pathInPrivateDocumentsDirectory:(NSString *)filename
{
    return [[self privateDocumentsDirectory] stringByAppendingPathComponent:filename];
}

+ (NSString *)cachesDirectory
{
    NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [dirs objectAtIndex:0];
}
+ (NSString *)pathInCachesDirectory:(NSString *)filename
{
    return [[self cachesDirectory] stringByAppendingPathComponent:filename];
}

+ (NSString *)temporaryDirectory
{
    return NSTemporaryDirectory();
}
+ (NSString *)pathInTemporaryDirectory:(NSString *)filename
{
    return [[self temporaryDirectory] stringByAppendingPathComponent:filename];
}

@end