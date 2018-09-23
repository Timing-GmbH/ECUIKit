//
//  ECColor.m
//  ECUIKit
//
//  Created by Daniel Alm on 23.09.18.
//  Copyright © 2018 EUROCOMP. All rights reserved.
//

#import "ECColor.h"

@implementation UIColor (ECUIKit)

+ (UIColor *)ec_textColor {
#if TARGET_OS_IPHONE
	return [self blackColor];
#else
	return [self textColor];
#endif
}

@end
