//
//  UIFont+Nerdvana.h
//  PocketTech
//
//  Created by Michael Ward on 10/10/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Nerdvana)

+ (UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize constrainedToSize:(CGSize)maxSize forText:(NSString *)text;

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize constrainedToSize:(CGSize)maxSize forText:(NSString *)text;

@end
