//
//  ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 04.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE

// iOS
#define ECFont UIFont
#define ECImage UIImage
#define ECColor UIColor
#define ECView UIView
#define ECScrollView UIScrollView
#define ECBezierPath UIBezierPath

#define ECRGBCOLOR(r,g,b) [ECColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ECRGBACOLOR(r,g,b,a) [ECColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#else

// Mac
#define ECFont NSFont
#define ECImage NSImage
#define ECColor NSColor
#define ECBezierPath NSBezierPath
#define ECView NSView
#define ECImageView NSImageView
#define ECButton NSButton


#define UIFont ECFont
#define UIImage ECImage
#define UIColor ECColor
#define UIBezierPath ECBezierPath
#define UIView ECView
#define UIScrollView ECScrollView
#define UIImageView ECImageView
#define UIButton ECButton

#define UIDocument NSDocument
#define UIDocumentChangeDone NSChangeDone

#define UIPrintPageRenderer ECPrintPageRenderer
#define UIPrintFormatter ECPrintFormatter

#define UIEdgeInsets NSEdgeInsets
#define UIEdgeInsetsMake(a, b, c, d) NSEdgeInsetsMake(a, b, c, d)

#define NSTextAlignmentLeft NSLeftTextAlignment
#define NSTextAlignmentRight NSRightTextAlignment
#define NSTextAlignmentCenter NSCenterTextAlignment

#define EAGLContext NSOpenGLContext
#define glGenVertexArraysOES glGenVertexArrays
#define glBindVertexArrayOES glBindVertexArray
#define glDeleteVertexArraysOES glDeleteVertexArrays


#define didMoveToSuperview viewDidMoveToSuperview


#define colorWithRed colorWithSRGBRed
#define ECRGBCOLOR(r,g,b) [ECColor colorWithSRGBRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ECRGBACOLOR(r,g,b,a) [ECColor colorWithSRGBRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#endif

#import "ECLog.h"

#import "ECCoreGraphics.h"

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import "NSFont+ECUIKit.h"
#import "NSString+ECUIKit.h"
#import "NSBezierPath+ECUIKit.h"
#import "NSValue+ECUIKit.h"
#import "NSOpenGLContext+ECUIKit.h"

#import "NSView+ECUIKit.h"
#import "NSScrollView+ECUIKit.h"
#import "NSTableView+ECUIKit.h"

#import "ECPrintPageRenderer.h"
#import "ECPrintFormatter.h"
#endif
