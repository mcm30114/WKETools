//
//  NSObject+BlockAdditions.h
//  Bongiovi
//
//  Created by Michael L. Ward on 4/29/11.
//  Copyright 2011 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Nerdvana)

+ (NSString *)documentsDirectory;
+ (NSString *)pathInDocumentsDirectory:(NSString *)filename;

+ (NSString *)privateDocumentsDirectory;
+ (NSString *)pathInPrivateDocumentsDirectory:(NSString *)filename;

+ (NSString *)cachesDirectory;
+ (NSString *)pathInCachesDirectory:(NSString *)filename;

+ (NSString *)temporaryDirectory;
+ (NSString *)pathInTemporaryDirectory:(NSString *)filename;

@end