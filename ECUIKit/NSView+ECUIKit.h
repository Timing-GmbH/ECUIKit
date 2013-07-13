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
#define UIViewAutoresizingFlexibleLeftMargin NSViewMinXMargin
#define UIViewAutoresizingFlexibleRightMargin NSViewMaxXMargin
#define UIViewAutoresizingFlexibleTopMargin NSViewMinYMargin
#define UIViewAutoresizingFlexibleBottomMargin NSViewMaxYMargin

@interface NSView (ECUIKit)

@property (nonatomic) CGFloat alpha;

- (void)setNeedsDisplay;

@end
