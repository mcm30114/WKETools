//
//  mwtools.h
//  mwtools
//
//  Created by Michael Ward on 9/23/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//


/************************************\
 LIBRARY-SPECIFIC HEADER USAGE NOTES:
 
 + A comment such as // (mylib.dylib / USE_MYLIB) means:
    + you must link your target against mylib.dylib
    + you must #define USE_MYLIB prior to importing WKETools.h
 + Headers for library-specific includes should be imported before WKETools.h
 + Corollary: if importing into Prefix.pch, WKETools.h should be imported last
 + Don't forget that you actually have to link against the marked library for library-specific includes

\************************************/

#ifndef wwtools_h
#define wwtools_h

    // Useful anywhere
    #import "WKEMath.h"

    // Foundation-specific
    #ifdef FOUNDATION_EXTERN
        #import "DLog.h"
        #import "NSObject+Nerdvana.h"
        #import "NSArray+Nerdvana.h"
        #import "NSMutableArray+Nerdvana.h"
        #import "NSDate+Nerdvana.h"
        #import "NSString+Nerdvana.h"
        #import "NSString+libxml_Nerdvana.h" // (libxml2.dylib / USE_LIBXML_NERDVANA)
        #import "NSMutableString+Nerdvana.h"
        #import "NSFileManager+Nerdvana.h"
        #import "NSURL+Nerdvana.h"
    #endif

    // iOS-specific
    #ifdef UIKIT_EXTERN
        #import "UIDevice+Nerdvana.h"
        #import "UIApplication+Nerdvana.h"
        #import "UIFont+Nerdvana.h"
        #import "UILabel+Nerdvana.h"
        #import "UIAlertView+Nerdvana.h"
    #endif

#endif
