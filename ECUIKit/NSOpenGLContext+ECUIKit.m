//
//  NSOpenGLContext+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 16.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSOpenGLContext+ECUIKit.h"

@implementation NSOpenGLContext (ECUIKit)

+ (void)setCurrentContext:(NSOpenGLContext *)context
{
	[context makeCurrentContext];
}

@end
