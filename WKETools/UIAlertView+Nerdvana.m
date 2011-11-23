//
//  UIAlertView+Nerdvana.m
//  IFE Trainer
//
//  Created by Michael Ward on 11/6/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "UIAlertView+Nerdvana.h"

@implementation UIAlertView (Nerdvana)

- (BOOL)buttonAtIndex:(NSInteger)i hasTitle:(NSString *)str
{
    return [[self buttonTitleAtIndex:i] isEqualToString:str];
}

@end
