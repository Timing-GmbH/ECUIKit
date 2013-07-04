//
//  NSFont+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 02.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSFont+ECUIKit.h"

#import <objc/runtime.h>

@implementation NSFont (ECUIKit)

- (CGFloat)lineHeight
{
	return (self.ascender - self.descender) + 1;
}

- (NSFont *)fontWithSize:(CGFloat)size
{
	return [[self class] fontWithDescriptor:self.fontDescriptor size:size];
}

@end
