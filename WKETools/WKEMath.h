//
//  MWMath.h
//  mwtools
//
//  Created by Michael L. Ward on 5/16/11.
//  Copyright 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


// Dice / Pseudorandom Numbers
int RollD20(void);
int RollD100(void);
int RandomUnder100(void);
double RandomPercent(void);
BOOL IsPrime(NSInteger num);