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
	return [self systemRedColor];
}

+ (UIColor *)ec_systemBlueColor {
#if TARGET_OS_IPHONE
	if (@available(iOS 11.0, *)) {
#else
	if (@available(macOS 10.13, *)) {
#endif
		return [UIColor colorNamed:@"customSystemBlue"];
	} else {
		return [self blueColor];
	}
}

+ (UIColor *)ec_textColor {
#if TARGET_OS_IPHONE
	if (@available(iOS 13.0, *)) {
		return [self labelColor];
	} else {
		return [self blackColor];
	}
#else
	return [self textColor];
#endif
}

+ (UIColor *)ec_secondaryLabelColor {
#if TARGET_OS_IPHONE
	if (@available(iOS 13.0, *)) {
		return [self secondaryLabelColor];
	} else {
		return ECRGBACOLOR(0, 0, 0, 0.5);
	}
#else
	return [self secondaryLabelColor];
#endif
}

+ (UIColor *)ec_viewBackgroundColor {
#if TARGET_OS_IPHONE
	if (@available(iOS 13.0, *)) {
		return [self systemBackgroundColor];
	} else {
		return [self whiteColor];
	}
#else
	return [self controlBackgroundColor];
#endif
}

@end
