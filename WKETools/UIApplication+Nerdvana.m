//
//  UIApplication+Nerdvana.m
//  PocketTech
//
//  Created by Michael Ward on 11/7/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "UIApplication+Nerdvana.h"

@implementation UIApplication (Nerdvana)

+ (NSString *)versionString
{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *build = [infoDict objectForKey:@"CFBundleVersion"];
    NSString *version = [infoDict objectForKey:@"CFBundleShortVersionString"];
    NSString *string = [NSString stringWithFormat:@"%@ (%@)",version,build];
    return string;
}

@end
