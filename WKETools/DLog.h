//
//  DLog.h
//  mwtools
//
//  Created by Michael Ward on 9/23/11.
//  Copyright (c) 2011 Big Nerd Ranch, Inc. All rights reserved.
//

#ifndef mwtools_DLog_h
#define mwtools_DLog_h

// DLog is almost a drop-in replacement for NSLog
// DLog();
// DLog(@"here");
// DLog(@"value: %d", x);
// Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s(%d) ### " fmt), __func__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s(%d) ### " fmt), __func__, __LINE__, ##__VA_ARGS__);

#endif
