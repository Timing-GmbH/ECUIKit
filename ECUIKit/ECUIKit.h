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

#define UIGraphicsPushContext(ctx) { [NSGraphicsContext saveGraphicsState]; \
NSGraphicsContext * nscg = [NSGraphicsContext graphicsContextWithGraphicsPort:ctx flipped:YES]; \
[NSGraphicsContext setCurrentContext:nscg]; }
#define UIGraphicsPopContext() [NSGraphicsContext restoreGraphicsState];
#endif

#define ECRGBCOLOR(r,g,b) [ECColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#import "ECLog.h"

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import "NSFont+ECUIKit.h"
#import "NSString+ECUIKit.h"
#import "NSView+ECUIKit.h"
#import "NSScrollView+ECUIKit.h"
#endif
