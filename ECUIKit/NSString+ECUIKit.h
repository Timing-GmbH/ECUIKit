//
//  NSString+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 29.06.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ECUIKit)

- (CGSize)sizeWithFont:(NSFont *)font;
- (CGSize)sizeWithFont:(NSFont *)font constrainedToSize:(CGSize)size;

- (CGSize)drawAtPoint:(CGPoint)point withFont:(NSFont *)font;
- (CGSize)drawInRect:(CGRect)rect withFont:(NSFont *)font;
- (CGSize)drawInRect:(CGRect)rect withFont:(NSFont *)font andColor:(NSColor *)color;
- (CGSize)drawInRect:(CGRect)rect withFont:(NSFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment;

@end
