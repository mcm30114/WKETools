//
//  MWMath.m
//  mwtools
//
//  Created by Michael L. Ward on 5/16/11.
//  Copyright 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import "WKEMath.h"

int RollD20()
{
    return (arc4random() % 20) + 1;
}

int RollD100()
{
    return (arc4random() % 100) + 1;
}

int RandomUnder100()
{
    return (int)(arc4random() % 100);
}

double RandomPercent()
{
    return (arc4random() % 100001) / 100000.0;
}

BOOL IsPrime(NSInteger num)
{
    for (int i = 2; i < (num/2)+1; i++) {
        if (num%i==0) {
            return YES;
        }
    }
    
    return NO;
}
