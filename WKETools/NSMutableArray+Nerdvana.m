//
//  NSMutableArray+Nerdvana.m
//  mwtools
//
//  Created by Michael Ward on 9/6/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "NSMutableArray+Nerdvana.h"

@implementation NSMutableArray (Nerdvana)

- (void)appendObjects:(id)firstObject,...
{
    id currentObject;
    va_list argList;
    
    if (firstObject) {
        [self addObject:firstObject];
        
        va_start(argList, firstObject);
        while ((currentObject = va_arg(argList, id))) {
            [self addObject:currentObject];
        }
        va_end(argList);
    }
}

- (void)prependObjects:(id)firstObject,...
{
    id currentObject = nil;
    va_list argList;
    int idx = 0;
    
    if (firstObject) {
        [self insertObject:firstObject atIndex:0];
        
        va_start(argList, firstObject);
        while ((currentObject = va_arg(argList, id))) {
            idx++;
            [self insertObject:currentObject atIndex:idx];
        }
        va_end(argList);
    }
}

@end
