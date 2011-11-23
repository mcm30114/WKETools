//
//  libxml+Nerdvana.h
//  IFE Trainer
//
//  Created by Michael Ward on 10/26/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//
#ifdef USE_LIBXML_NERDVANA

@interface NSString (libxml_Nerdvana)

- (NSString *)stringByReplacingHTMLEntities;

@end

#endif