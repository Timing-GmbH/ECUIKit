//
//  NSView+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 08.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define UIViewAutoresizingFlexibleWidth NSViewWidthSizable
#define UIViewAutoresizingFlexibleHeight NSViewHeightSizable

@interface NSView (ECUIKit)

- (void)setNeedsDisplay;

@end
