//
//  NSValue+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 10.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSValue+ECUIKit.h"

@implementation NSValue (ECUIKit)

+ (instancetype)valueWithCGPoint:(CGPoint)point
{
	return [self valueWithPoint:point];
}

- (CGPoint)CGPointValue
{
	return [self pointValue];
}

@end
