//
//  ECPrintFormatter.m
//  ECUIKit
//
//  Created by Daniel Alm on 25.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "ECPrintFormatter.h"

@implementation ECPrintFormatter

- (void)removeFromPrintPageRenderer
{
	[self.printPageRenderer removePrintFormatter:self];
}

- (CGRect)rectForPageAtIndex:(NSInteger)pageIndex
{
	return CGRectZero;
}
- (void)drawInRect:(CGRect)rect forPageAtIndex:(NSInteger)pageIndex
{
}

@end
