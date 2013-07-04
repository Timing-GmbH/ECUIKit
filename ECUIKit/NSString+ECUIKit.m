//
//  NSString+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 29.06.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSString+ECUIKit.h"

#import <objc/runtime.h>

NSString *const FKStringSizeCache = @"FKStringSizeCache";

#pragma mark - NSString (ECUIKit)

@implementation NSString (ECUIKit)

- (CGSize)sizeWithFont:(NSFont *)font
{
	return [self sizeWithAttributes:@{ NSFontAttributeName : font }];
}
- (CGSize)sizeWithFont:(NSFont *)font constrainedToSize:(CGSize)size
{
	return [self boundingRectWithSize:size options:0 attributes:@{ NSFontAttributeName : font }].size;
}

- (CGSize)drawAtPoint:(CGPoint)point withFont:(NSFont *)font
{
	[self drawAtPoint:point withAttributes:@{ NSFontAttributeName : font }];
	return [self sizeWithFont:font];
}

- (CGSize)drawInRect:(CGRect)rect withFont:(NSFont *)font
{
	[self drawInRect:rect withAttributes:@{ NSFontAttributeName : font }];
	return [self sizeWithFont:font constrainedToSize:rect.size];
}

@end
