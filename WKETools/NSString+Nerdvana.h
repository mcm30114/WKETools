//
//  NSString+Nerdvana.h
//  mwtools
//
//  Created by Michael Ward on 9/27/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Nerdvana)

- (NSString *)stringByStrippingTags;
- (NSString *)stringByTrimmingLeadingWhitespace;
- (NSString *)stringByTrimmingTrailingWhitespace;
- (NSString *)stringByTrimmingOuterWhitespace;
- (BOOL)containsString:(NSString *)subStr caseSensitive:(BOOL)isCaseSensitive;

@end
