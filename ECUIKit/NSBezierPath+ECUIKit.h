//
//  NSBezierPath+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 09.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSBezierPath (ECUIKit)

- (void)addLineToPoint:(CGPoint)point;
- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;

- (void)applyTransform:(CGAffineTransform)transform;

@end
