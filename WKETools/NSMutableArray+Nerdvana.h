//
//  NSMutableArray+Nerdvana.h
//  mwtools
//
//  Created by Michael Ward on 9/6/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Nerdvana)

- (void)appendObjects:(id)firstObject,...;
- (void)prependObjects:(id)firstObject,...;

@end
