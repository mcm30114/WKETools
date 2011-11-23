//
//  NSURL+Nerdvana.m
//  PocketTech
//
//  Created by Michael Ward on 11/7/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "NSURL+Nerdvana.h"

@implementation NSURL (Nerdvana)

+ (NSURL *)URLByEncodingString:(NSString *)str
{
    return [self URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end
