//
//  UILabel+Nerdvana.m
//  PocketTech
//
//  Created by Michael Ward on 10/10/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "UILabel+Nerdvana.h"

@implementation UILabel (WardWare)

- (void)setFittedText:(NSString *)text ofSize:(CGFloat)size
{
    UIFont *currentFont = [self font];
    UIFont *font = [UIFont fontWithName:[currentFont fontName] size:size constrainedToSize:self.bounds.size forText:text];
    self.text = text;
    self.font = font;
}

- (void)setFittedText:(NSString *)text
{
    UIFont *currentFont = [self font];
    UIFont *font = [UIFont fontWithName:[currentFont fontName] size:30.0 constrainedToSize:self.bounds.size forText:text];
    self.text = text;
    self.font = font;
}

- (NSString *)fittedText
{
    return self.text;
}

@end
