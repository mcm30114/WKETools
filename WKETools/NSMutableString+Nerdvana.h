//
//  NSMutableString+Nerdvana.h
//  mwtools
//
//  Created by Michael Ward on 9/27/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (Nerdvana)

- (void)replaceOccurencesOfString:(NSString *)searchString withString:(NSString *)replacement;
- (void)stripTags;

@end
