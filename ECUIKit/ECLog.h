//
//  ECLog.h
//  ECUIKit
//
//  Created by Daniel Alm on 04.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ECLOGLEVEL_INFO     5
#define ECLOGLEVEL_WARNING  3
#define ECLOGLEVEL_ERROR    1

#ifndef ECMAXLOGLEVEL
#ifdef DEBUG
#define ECMAXLOGLEVEL ECLOGLEVEL_INFO
#else
#define ECMAXLOGLEVEL ECLOGLEVEL_WARNING
#endif
#endif

// The general purpose logger. This ignores logging levels.
#define ECPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

// Debug-only assertions.
// Log-level based logging macros.
#if ECLOGLEVEL_ERROR <= ECMAXLOGLEVEL
#ifdef DEBUG
#define ECDFATAL(xx, ...)  NSAssert(false, xx, ##__VA_ARGS__)
#else
#define ECDFATAL(xx, ...)  ECPRINT(xx, ##__VA_ARGS__)
#endif
#else
#define ECDFATAL(xx, ...)  ((void) (0, ##__VA_ARGS__))
#endif // #if ECLOGLEVEL_ERROR <= ECMAXLOGLEVEL

#if ECLOGLEVEL_ERROR <= ECMAXLOGLEVEL
#define ECERROR(xx, ...)  ECPRINT(xx, ##__VA_ARGS__)
#else
#define ECERROR(xx, ...)  ((void) (0, ##__VA_ARGS__))
#endif // #if ECLOGLEVEL_ERROR <= ECMAXLOGLEVEL

#if ECLOGLEVEL_WARNING <= ECMAXLOGLEVEL
#define ECWARNING(xx, ...)  ECPRINT(xx, ##__VA_ARGS__)
#else
#define ECWARNING(xx, ...)  ((void) (0, ##__VA_ARGS__))
#endif // #if ECLOGLEVEL_WARNING <= ECMAXLOGLEVEL

#if ECLOGLEVEL_INFO <= ECMAXLOGLEVEL
#define ECINFO(xx, ...)  ECPRINT(xx, ##__VA_ARGS__)
#else
#define ECINFO(xx, ...)  ((void) (0, ##__VA_ARGS__))
#endif // #if ECLOGLEVEL_INFO <= ECMAXLOGLEVEL
