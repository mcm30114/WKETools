//
//  NSObject+BlockAdditions.m
//  Bongiovi
//
//  Created by Michael L. Ward on 4/29/11.
//  Copyright 2011 Big Nerd Ranch. All rights reserved.
//

#import "NSObject+Nerdvana.h"

@implementation NSObject (Nerdvana)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay onMainThread:(BOOL)useMainThread
{
    int64_t delta = (int64_t)(1.0e9 * delay);
    
    if (useMainThread) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
    }
}

- (NSString *)className
{
    return NSStringFromClass([self class]);
}

@end