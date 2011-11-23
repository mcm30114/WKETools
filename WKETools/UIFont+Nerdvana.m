//
//  UIFont+Nerdvana.m
//

/*
 Modified from code snippet found at http://www.11pixel.com/blog/28/resize-multi-line-text-to-fit-uilabel-on-iphone/ on 2011-10-10
 Original version Copyright © 2004-2009 11 Pixel Studios.
 */

#import "UIFont+Nerdvana.h"

@implementation UIFont (Nerdvana)

+ (UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize constrainedToSize:(CGSize)maxSize forText:(NSString *)text
{
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    
    for(int i = fontSize; i > 10; i=i-2)
    {
        font = [font fontWithSize:i];
        // You can log the size you're trying: DLog(@"Trying size: %u", i);
        
        CGSize constraintSize = CGSizeMake(maxSize.width, MAXFLOAT);
        
        CGSize labelSize = [text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        if(labelSize.height <= maxSize.height)
            break;
    }
    // You can see what size the function is using by outputting: DLog(@"Best size is: %u", i);
    
    return font;
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize constrainedToSize:(CGSize)maxSize forText:(NSString *)text
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    for(int i = fontSize; i > 10; i=i-2)
    {
        font = [font fontWithSize:i];
        // You can log the size you're trying: DLog(@"Trying size: %u", i);
        
        CGSize constraintSize = CGSizeMake(maxSize.width, MAXFLOAT);
        
        CGSize labelSize = [text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        if(labelSize.height <= maxSize.height)
            break;
    }
    // You can see what size the function is using by outputting: DLog(@"Best size is: %u", i);
    
    return font;
}

@end
