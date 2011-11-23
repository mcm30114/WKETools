//
//  NSDate+Nerdvana.m
//  mwtools
//
//  Created by Michael Ward on 9/23/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "NSDate+Nerdvana.h"

@implementation NSDate (Nerdvana)

+ (NSString *)formattedTimeInterval:(NSTimeInterval)time
{
    NSTimeInterval seconds = fmod(time, 60.0);
	NSTimeInterval minutes = fmod((time - seconds) / 60.0, 60.0);
	NSTimeInterval hours = (time - (minutes * 60.0) - seconds) / 3600;
    if (hours > 0)
        return [NSString stringWithFormat:@"%.0f:%02.0f:%02.0f", hours, minutes, seconds];
    else
        return [NSString stringWithFormat:@"%.0f:%02.0f", minutes, seconds];
}

+ (NSDate *)dateWithRSSPubDate:(NSString *)pubDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZ"];
    NSDate *date = [dateFormatter dateFromString:pubDate];
    return date;
}

- (NSString *)rssString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZ";
    NSMutableString *dateString = [[dateFormatter stringFromDate:self] mutableCopy];
    [dateString insertString:@":" atIndex:22];
    [dateString replaceOccurrencesOfString:@":" withString:@"%3A" options:0 range:NSMakeRange(0, [dateString length]-1)];
    return dateString;
}

- (NSString *)relativeDateString
{
    const int SECOND = 1;
    const int MINUTE = 60 * SECOND;
    const int HOUR = 60 * MINUTE;
    const int DAY = 24 * HOUR;
    const int MONTH = 30 * DAY;
    
    NSDate *now = [NSDate date];
    NSTimeInterval delta = [self timeIntervalSinceDate:now] * -1.0;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger units = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
	NSDateComponents *components = [calendar components:units fromDate:self toDate:now options:0];
    
    NSString *relativeString;
    
    if (delta < 0) {
        relativeString = @"!n the future!";
        
    } else if (delta < 1 * MINUTE) {
        relativeString = (components.second == 1) ? @"One second ago" : [NSString stringWithFormat:@"%d seconds ago",components.second];
        
    } else if (delta < 2 * MINUTE) {
        relativeString =  @"a minute ago";
        
    } else if (delta < 45 * MINUTE) {
        relativeString = [NSString stringWithFormat:@"%d minutes ago",components.minute];
        
    } else if (delta < 90 * MINUTE) {
        relativeString = @"an hour ago";
        
    } else if (delta < 24 * HOUR) {
        relativeString = [NSString stringWithFormat:@"%d hours ago",components.hour];
        
    } else if (delta < 48 * HOUR) {
        relativeString = @"yesterday";
        
    } else if (delta < 30 * DAY) {
        relativeString = [NSString stringWithFormat:@"%d days ago",components.day];
        
    } else if (delta < 12 * MONTH) {
        relativeString = (components.month <= 1) ? @"one month ago" : [NSString stringWithFormat:@"%d months ago",components.month];
        
    } else {
        relativeString = (components.year <= 1) ? @"one year ago" : [NSString stringWithFormat:@"%d years ago",components.year];
    
    }
                          
    return relativeString;
}

- (BOOL)isEarlierThanDate:(NSDate *)otherDate
{
    return ([[self earlierDate:otherDate] isEqualToDate:self]);
}

- (BOOL)isAfterDate:(NSDate *)otherDate
{
    return ([[self laterDate:otherDate] isEqualToDate:self]);
}

@end
