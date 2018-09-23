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

- (NSComparisonResult)ec_versionStringCompare:(NSString *)other {
	NSArray *oneComponents = [self componentsSeparatedByString:@"a"];
	NSArray *twoComponents = [other componentsSeparatedByString:@"a"];
	
	// The parts before the "a"
	NSString *oneMain = [oneComponents objectAtIndex:0];
	NSString *twoMain = [twoComponents objectAtIndex:0];
	
	// If main parts are different, return that result, regardless of alpha part
	NSComparisonResult mainDiff;
	if ((mainDiff = [oneMain compare:twoMain]) != NSOrderedSame) {
		return mainDiff;
	}
	
	// At this point the main parts are the same; just deal with alpha stuff
	// If one has an alpha part and the other doesn't, the one without is newer
	if ([oneComponents count] < [twoComponents count]) {
		return NSOrderedDescending;
		
	} else if ([oneComponents count] > [twoComponents count]) {
		return NSOrderedAscending;
		
	} else if ([oneComponents count] == 1) {
		// Neither has an alpha part, and we know the main parts are the same
		return NSOrderedSame;
	}
	
	// At this point the main parts are the same and both have alpha parts. Compare the alpha parts
	// numerically. If it's not a valid number (including empty string) it's treated as zero.
	NSNumber *oneAlpha = [NSNumber numberWithInt:[[oneComponents objectAtIndex:1] intValue]];
	NSNumber *twoAlpha = [NSNumber numberWithInt:[[twoComponents objectAtIndex:1] intValue]];
	return [oneAlpha compare:twoAlpha];
}


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

	return ECCGSizeIntegralize([self boundingRectWithSize:size
												  options:NSStringDrawingUsesLineFragmentOrigin
											   attributes:@{ NSFontAttributeName : font,
															 NSParagraphStyleAttributeName : paragraphStyle }
#if TARGET_OS_IPHONE
												  context:nil
#endif
								].size);
}

- (CGSize)ec_drawAtPoint:(CGPoint)point withFont:(ECFont *)font andColor:(ECColor *)color
{
	[self drawAtPoint:point withAttributes:@{ NSFontAttributeName : font, NSForegroundColorAttributeName : color }];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font andColor:(ECColor *)color
{
	[self drawWithRect:rect
			   options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics)
			attributes:@{ NSFontAttributeName : font, NSForegroundColorAttributeName : color }
#if TARGET_OS_IPHONE
			   context:nil
#endif
	 ];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment
{
	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	paragraphStyle.lineBreakMode = lineBreakMode;
	paragraphStyle.alignment = alignment;
	[self drawWithRect:rect
			   options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics)
			attributes:@{ NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle }
#if TARGET_OS_IPHONE
			   context:nil
#endif
	 ];
	return [self ec_sizeWithFont:font];
}

- (CGSize)ec_drawInRect:(CGRect)rect withFont:(ECFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment color:(ECColor *)color
{
	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	paragraphStyle.lineBreakMode = lineBreakMode;
	paragraphStyle.alignment = alignment;
	[self drawWithRect:rect
			   options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics)
			attributes:@{ NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle, NSForegroundColorAttributeName : color }
#if TARGET_OS_IPHONE
			   context:nil
#endif
	 ];
	return [self ec_sizeWithFont:font];
}

@end
