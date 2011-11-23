//
//  libxml+Nerdvana.m
//  IFE Trainer
//
//  Created by Michael Ward on 10/26/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//
#ifdef USE_LIBXML_NERDVANA
#import "NSString+libxml_Nerdvana.h"
#import <libxml/HTMLparser.h>

@implementation NSString (libxml_Nerdvana)


// @author Jeremy W. Sherman (Big Nerd Ranch, Inc.)
// @date 2011-03-20
// Converted to instance method for WKETools by Mikey Ward 2011-10-10
- (NSString *)stringByReplacingHTMLEntities

{    
    BOOL hasEscaped = [self rangeOfString:@"&"].length > 0;
    if (!hasEscaped) return self;
    
    NSMutableString *builder = [[NSMutableString alloc] init];
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    while (![scanner isAtEnd]) {
        NSString *str = nil;
        BOOL didScan = [scanner scanUpToString:@"&" intoString:&str];
        if (didScan) {
            [builder appendString:str];
        }
        
        NSString *name = nil;
        didScan = [scanner scanUpToString:@";" intoString:&name];
        if (!didScan) continue;  /* Eat "&;...". */
        
        /* Check that we can at least fit in "&lt". */
        BOOL tooShortForRef = ([name length] < 3);
        if (tooShortForRef) {
            [builder appendString:name];
            continue;
        }
        
        /* We know it's at least 3 chars long. */
        NSRange r = {1, 1};
        NSString *firstChar = [name substringWithRange:r];
        BOOL isNumericCharRef = [firstChar isEqualToString:@"#"];
        if (isNumericCharRef) {
            /* It's a numeric character reference.
             * |name| should look like "&NNN" or "&xNNN".
             * Both &x and &X are allowed. */
            r = (NSRange){2, 1};
            NSString *secondChar = [name substringWithRange:r];
            BOOL isHex = ([secondChar isEqualToString:@"x"]
                          || [secondChar isEqualToString:@"X"]);
            
            r.location = isHex? 3 : 2;
            NSUInteger len = [name length];
            r.length = len;
            r.length -= r.location;
            NSString *numStr = [name substringWithRange:r];
            
            NSScanner *numScanner = [[NSScanner alloc] initWithString:numStr];
            unichar unival = 0;
            if (isHex) {
                unsigned long long hexval = 0;
                BOOL ok = [numScanner scanHexLongLong:&hexval];
                BOOL wasAllNum = [numScanner isAtEnd];
                
                if (!ok || !wasAllNum) {
                    [builder appendString:name];
                    continue;
                }
                
                unival = hexval;
            } else {
                long long numval;
                BOOL ok = [numScanner scanLongLong:&numval];
                BOOL wasAllNum = [numScanner isAtEnd];
                
                if (!ok || !wasAllNum) {
                    [builder appendString:name];
                    continue;
                }
                
                unival = numval;
            }
            
            NSString *uniStr = [[NSString alloc] initWithCharacters:&unival length:1];
            [builder appendString:uniStr];
            
            /* Eat the colon. */
            [scanner scanString:@";" intoString:NULL];
        }  else {
            /* Character entity reference */
            NSString *entityName = [name substringFromIndex:1];
            xmlChar *xmlname = BAD_CAST [entityName UTF8String];
            const htmlEntityDesc *entity = htmlEntityLookup(xmlname);
            if (entity) {
                unichar unival = entity->value;
                NSString *uniStr = [[NSString alloc] initWithCharacters:&unival length:1];
                [builder appendString:uniStr];
                
                /* Eat the colon. */
                [scanner scanString:@";" intoString:NULL];
            } else {
                /* Not a known entity. Tack it on and hope. */
                [builder appendString:name];
            }
        }
    }  /* while !atEnd */
    return builder;
}

@end






#endif