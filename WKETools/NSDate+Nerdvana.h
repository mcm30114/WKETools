//
//  NSDate+Nerdvana.h
//  mwtools
//
//  Created by Michael Ward on 9/23/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Nerdvana)

+ (NSString *)formattedTimeInterval:(NSTimeInterval)time;

+ (NSDate *)dateWithRSSPubDate:(NSString *)pubDate;
- (NSString *)rssString;

- (NSString *)relativeDateString;

- (BOOL)isEarlierThanDate:(NSDate *)otherDate;
- (BOOL)isAfterDate:(NSDate *)otherDate;

@end
