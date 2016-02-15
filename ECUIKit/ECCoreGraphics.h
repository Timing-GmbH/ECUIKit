//
//  ECCoreGraphics.h
//  ECUIKit
//
//  Created by Daniel Alm on 02.09.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ECUIKit.h"

#if !TARGET_OS_IPHONE

CGContextRef UIGraphicsGetCurrentContext();

void UIGraphicsPushContext(CGContextRef context);

void UIGraphicsPopContext();

#else
#import <UIKit/UIKit.h>
#endif

UIImage *ECDrawImageUsingBlock(CGSize size, BOOL opaque, CGFloat scale, void (^drawBlock)());

NSData *ECDrawPDFUsingBlock(CGSize size, void (^drawBlock)());
