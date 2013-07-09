//
//  NSBezierPath+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 09.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSBezierPath+ECUIKit.h"

@implementation NSBezierPath (ECUIKit)

- (void)addLineToPoint:(CGPoint)point
{
	[self lineToPoint:point];
}
- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
{
	[self appendBezierPathWithArcWithCenter:center
									 radius:radius
								 startAngle:(startAngle * 180. / M_PI)
								   endAngle:(endAngle * 180. / M_PI)
								  clockwise:!clockwise];
}

- (void)applyTransform:(CGAffineTransform)transform
{
	NSAffineTransform *affineTransform = [NSAffineTransform transform];
	affineTransform.transformStruct = (NSAffineTransformStruct) {
		.m11 = transform.a,
		.m12 = transform.b,
		.m21 = transform.c,
		.m22 = transform.d,
		.tX = transform.tx,
		.tY = transform.ty
	};
	[self transformUsingAffineTransform:affineTransform];
}

@end
