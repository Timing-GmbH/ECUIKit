//
//  ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 04.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#define ECFont UIFont
#define ECImage UIImage
#define ECColor UIColor
#define ECView UIView
#define ECBezierPath UIBezierPath
#else
#define ECFont NSFont
#define ECImage NSImage
#define ECColor NSColor
#define ECView NSView
#define ECBezierPath NSBezierPath
#endif

#if !TARGET_OS_IPHONE
#import "NSFont+ECUIKit.h"
#import "NSString+ECUIKit.h"
#endif
