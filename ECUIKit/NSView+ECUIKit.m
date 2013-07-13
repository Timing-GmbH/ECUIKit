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

@end
