//
//  NSString+Nerdvana.m
//  mwtools
//
//  Created by Michael Ward on 9/27/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "NSString+Nerdvana.h"

@implementation NSString (Nerdvana)

- (NSString *)stringByStrippingTags
{
    NSScanner *theScanner;
    NSString *text = nil;
    NSMutableString *newString = [self mutableCopy];
    
    theScanner = [NSScanner scannerWithString:self];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ; 
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        [newString replaceOccurrencesOfString:[NSString stringWithFormat:@"%@>", text]
                                   withString:@""
                                      options:NSCaseInsensitiveSearch 
                                        range:NSMakeRange(0, newString.length)];        
    } 
    
    return newString;    
}

- (NSString *)stringByTrimmingLeadingWhitespace
{
    NSRange range = [self rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
    NSString *result = [self stringByReplacingCharactersInRange:range withString:@""];
    return result;
}

- (NSString *)stringByTrimmingTrailingWhitespace
{
    NSRange range = [self rangeOfString:@"\\s*$" options:NSRegularExpressionSearch];
    NSString *result = [self stringByReplacingCharactersInRange:range withString:@""];
    return result;
}

- (NSString *)stringByTrimmingOuterWhitespace
{
    NSMutableString *newString = [self mutableCopy];
    NSRange range = [newString rangeOfString:@"\\s*$" options:NSRegularExpressionSearch];
    [newString replaceCharactersInRange:range withString:@""];
    range = [newString rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
    [newString replaceCharactersInRange:range withString:@""];
    return newString;
}

- (BOOL)containsString:(NSString *)subStr caseSensitive:(BOOL)isCaseSensitive
{
    if (!subStr) {
        return NO;
    }
    
    if (isCaseSensitive) {
        NSRange textRange = [self rangeOfString:subStr];
        if (textRange.location != NSNotFound)
            return YES;
    } else {
        NSRange textRange = [[self lowercaseString] rangeOfString:[subStr lowercaseString]];
        if (textRange.location != NSNotFound)
            return YES;
    }
    
    return NO;
}

@end
