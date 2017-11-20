//
//  NSString+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 29.06.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

#import "ECUIKit.h"

@interface NSString (ECUIKit)

- (NSComparisonResult)ec_versionStringCompare:(NSString *)other;

- (CGSize)ec_sizeWithFont:(ECFont *)font;
- (CGSize)ec_sizeWithFont:(ECFont *)font constrainedToSize:(CGSize)size;
- (CGSize)ec_sizeWithFont:(ECFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)ec_drawAtPoint:(CGPoint)point withFont:(ECFont *)font;
- (CGSize)ec_drawAtPoint:(CGPoint)point withFont:(ECFont *)font andColor:(ECColor *)color;

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font;
- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font andColor:(ECColor *)color;
- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment;
- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment color:(ECColor *)color;

@end
