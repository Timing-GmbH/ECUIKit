//
//  NSString+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 29.06.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSString+ECUIKit.h"

static CGSize ECCGSizeMakeIntegral(CGFloat width, CGFloat height)
{
	return CGSizeMake(ceilf(width), ceilf(height));
}
static CGSize ECCGSizeIntegralize(CGSize size)
{
	return ECCGSizeMakeIntegral(size.width, size.height);
}

#pragma mark - NSString (ECUIKit)

@implementation NSString (ECUIKit)

- (CGSize)ec_sizeWithFont:(ECFont *)font
{
	return ECCGSizeIntegralize([self sizeWithAttributes:@{ NSFontAttributeName : font }]);
}
- (CGSize)ec_sizeWithFont:(ECFont *)font constrainedToSize:(CGSize)size
{
	return [self ec_sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
}
- (CGSize)ec_sizeWithFont:(ECFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	paragraphStyle.lineBreakMode = lineBreakMode;
#if TARGET_OS_IPHONE
	return ECCGSizeIntegralize([self boundingRectWithSize:size
												  options:NSStringDrawingUsesLineFragmentOrigin
											   attributes:@{ NSFontAttributeName : font,
															 NSParagraphStyleAttributeName : paragraphStyle }
												  context:nil].size);
#else
	NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:
								  [[NSAttributedString alloc] initWithString:self
																  attributes:@{ NSFontAttributeName : font,
																				NSParagraphStyleAttributeName : paragraphStyle }]];
	NSTextContainer *textContainer = [[NSTextContainer alloc] initWithContainerSize:size];
	NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
	[layoutManager addTextContainer:textContainer];
	[textStorage addLayoutManager:layoutManager];
	[layoutManager glyphRangeForTextContainer:textContainer];
	return [layoutManager usedRectForTextContainer:textContainer].size;
#endif
}

- (CGSize)ec_drawAtPoint:(CGPoint)point withFont:(ECFont *)font
{
	[self drawAtPoint:point withAttributes:@{ NSFontAttributeName : font }];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawAtPoint:(CGPoint)point withFont:(ECFont *)font andColor:(ECColor *)color
{
	[self drawAtPoint:point withAttributes:@{ NSFontAttributeName : font, NSForegroundColorAttributeName : color }];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font
{
	[self drawInRect:rect withAttributes:@{ NSFontAttributeName : font }];
	return [self ec_sizeWithFont:font constrainedToSize:rect.size];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font andColor:(ECColor *)color
{
	[self drawInRect:rect withAttributes:@{ NSFontAttributeName : font, NSForegroundColorAttributeName : color }];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment
{
	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	paragraphStyle.lineBreakMode = lineBreakMode;
	paragraphStyle.alignment = alignment;
	[self drawInRect:rect withAttributes:@{ NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle }];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment color:(ECColor *)color
{
	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	paragraphStyle.lineBreakMode = lineBreakMode;
	paragraphStyle.alignment = alignment;
	[self drawInRect:rect withAttributes:@{ NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle, NSForegroundColorAttributeName : color }];
	return [self ec_sizeWithFont:font];
}

@end
