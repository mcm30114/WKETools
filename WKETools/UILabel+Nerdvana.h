//
//  UILabel+WardWare.h
//  PocketTech
//
//  Created by Michael Ward on 10/10/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WardWare)

- (void)setFittedText:(NSString *)text ofSize:(CGFloat)size;
@property (strong, nonatomic) NSString *fittedText;


@end
