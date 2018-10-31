//
//  ECColor.m
//  ECUIKit
//
//  Created by Daniel Alm on 23.09.18.
//  Copyright © 2018 EUROCOMP. All rights reserved.
//

#import "ECColor.h"

@implementation UIColor (ECUIKit)

+ (UIColor *)ec_systemRedColor {
#if TARGET_OS_IPHONE
	return [self redColor];
#else
	return [self systemRedColor];
#endif
}

+ (UIColor *)ec_systemBlueColor {
#if TARGET_OS_IPHONE
	return [self blueColor];
#else
	if (@available(macOS 10.13, *)) {
		return [UIColor colorNamed:@"customSystemBlue"];
	} else {
		return [self blueColor];
	}
#endif
}

+ (UIColor *)ec_textColor {
#if TARGET_OS_IPHONE
	return [self blackColor];
#else
	return [self textColor];
#endif
}

+ (UIColor *)ec_secondaryLabelColor {
#if TARGET_OS_IPHONE
	return ECRGBACOLOR(0, 0, 0, 0.5);
#else
	return [self secondaryLabelColor];
#endif
}

@end
