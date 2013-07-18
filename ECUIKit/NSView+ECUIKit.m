//
//  NSView+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 08.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSView+ECUIKit.h"

@implementation NSView (ECUIKit)

- (CGFloat)alpha
{
	return self.alphaValue;
}
- (void)setAlpha:(CGFloat)alpha
{
	self.alphaValue = alpha;
}

- (void)setNeedsDisplay
{
	[self setNeedsDisplay:YES];
}

+ (void)animateWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 animations:(void (^)(void))animations
				 completion:(void (^)(BOOL finished))completion
{
	if (animations)
		animations();
	if (completion)
		completion(YES);
}

+ (void)animateWithDuration:(NSTimeInterval)duration
				 animations:(void (^)(void))animations
				 completion:(void (^)(BOOL finished))completion
{
	[self animateWithDuration:duration delay:0 options:0 animations:animations completion:completion];
}
+ (void)animateWithDuration:(NSTimeInterval)duration
				 animations:(void (^)(void))animations
{
	[self animateWithDuration:duration animations:animations completion:nil];
}

@end
