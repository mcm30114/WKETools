//
//  NSObject+BlockAdditions.h
//  Bongiovi
//
//  Created by Michael L. Ward on 4/29/11.
//  Copyright 2011 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BasicBlock)(void);

@interface NSObject (Nerdvana)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay onMainThread:(BOOL)useMainThread;

- (NSString *)className;

@end