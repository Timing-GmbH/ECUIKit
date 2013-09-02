//
//  ECCoreGraphics.m
//  ECUIKit
//
//  Created by Daniel Alm on 02.09.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "ECCoreGraphics.h"

CGContextRef UIGraphicsGetCurrentContext()
{
	return [[NSGraphicsContext currentContext] graphicsPort];
}
void UIGraphicsPushContext(CGContextRef context)
{
	[NSGraphicsContext saveGraphicsState];
	NSGraphicsContext *nscg = [NSGraphicsContext graphicsContextWithGraphicsPort:context flipped:YES];
	[NSGraphicsContext setCurrentContext:nscg];
}
void UIGraphicsPopContext()
{
	[NSGraphicsContext restoreGraphicsState];
}
