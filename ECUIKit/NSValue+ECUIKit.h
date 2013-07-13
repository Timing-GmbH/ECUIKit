//
//  NSValue+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 10.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValue (ECUIKit)

+ (instancetype)valueWithCGPoint:(CGPoint)point;

- (CGPoint)CGPointValue;

@end
