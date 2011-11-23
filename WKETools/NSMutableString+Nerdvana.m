//
//  NSMutableString+Nerdvana.m
//  mwtools
//
//  Created by Michael Ward on 9/27/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "NSMutableString+Nerdvana.h"

@implementation NSMutableString (Nerdvana)

- (void)stripTags
{
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:self];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ; 
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        [self replaceOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] 
                              withString:@" " 
                                 options:NSCaseInsensitiveSearch 
                                   range:NSMakeRange(0, self.length)];
        
    }  
}

- (void)replaceOccurencesOfString:(NSString *)searchString withString:(NSString *)replacement
{
    [self replaceOccurrencesOfString:searchString withString:replacement options:0 range:NSMakeRange(0, self.length)];
}


@end
