//
//  NSScrollView+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 08.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSScrollView+ECUIKit.h"

@implementation NSScrollView (ECUIKit)

- (void)setContentSize:(CGSize)contentSize
{
	[self.documentView setFrameSize:contentSize];
}

- (CGPoint)contentOffset
{
	return self.documentVisibleRect.origin;
}
- (void)setContentOffset:(CGPoint)contentOffset
{
	[self.documentView scrollPoint:contentOffset];
}

@end
