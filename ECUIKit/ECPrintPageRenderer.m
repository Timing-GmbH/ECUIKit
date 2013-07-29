//
//  ECPrintPageRenderer.m
//  ECUIKit
//
//  Created by Daniel Alm on 25.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "ECPrintPageRenderer.h"

@implementation ECPrintPageRenderer
{
	NSMutableArray *_printFormatters;
}

@synthesize printFormatters = _printFormatters;

- (instancetype)init
{
	if ((self = [super initWithFrame:CGRectZero]))
	{
		_printFormatters = [NSMutableArray array];
	}
	return self;
}

#pragma mark - properties

- (CGRect)paperRect
{
	CGSize paperSize = [NSPrintOperation currentOperation].printInfo.paperSize;
	return (CGRect){ CGPointZero, paperSize };
}
- (CGRect)printableRect
{
	return [NSPrintOperation currentOperation].printInfo.imageablePageBounds;
}

- (NSInteger)numberOfPages
{
	return 0;
}

- (BOOL)isFlipped
{
	return YES;
}

#pragma mark - NSView printing

- (BOOL)knowsPageRange:(NSRangePointer)range
{
	range->location = 1;
	range->length = [self numberOfPages];
	self.frame = CGRectMake(0, 0, self.printableRect.size.width, range->length * self.printableRect.size.height);
	return YES;
}
- (NSRect)rectForPage:(NSInteger)page
{
	CGRect printableRect = self.printableRect;
	return CGRectMake(0, printableRect.size.height * (page - 1), printableRect.size.width, printableRect.size.height);
}
- (void)drawRect:(NSRect)dirtyRect
{
	NSInteger pageIndex = dirtyRect.origin.y / self.printableRect.size.height;
	[NSGraphicsContext saveGraphicsState];
	NSAffineTransform *rectTransform = [NSAffineTransform transform];
	[rectTransform translateXBy:0 yBy:(self.printableRect.size.height * pageIndex)];
	[rectTransform concat];
	[self drawPageAtIndex:pageIndex inRect:self.printableRect];
	[NSGraphicsContext restoreGraphicsState];
}

#pragma mark - handling print formatters

- (void)setPrintFormatters:(NSArray *)printFormatters
{
	for (UIPrintFormatter *formatter in _printFormatters)
		formatter.printPageRenderer = nil;
	_printFormatters = [printFormatters mutableCopy];
	for (UIPrintFormatter *formatter in _printFormatters)
		formatter.printPageRenderer = self;
}
- (void)addPrintFormatter:(UIPrintFormatter *)formatter startingAtPageAtIndex:(NSInteger)pageIndex
{
	formatter.startPage = pageIndex;
	formatter.printPageRenderer = self;
	[_printFormatters addObject:formatter];
}
- (void)removePrintFormatter:(UIPrintFormatter *)formatter
{
	if (formatter.printPageRenderer == self)
	{
		formatter.printPageRenderer = nil;
		[_printFormatters removeObject:formatter];
	}
}

- (NSArray *)printFormattersForPageAtIndex:(NSInteger)pageIndex
{
	NSMutableArray *formatters = [NSMutableArray arrayWithCapacity:self.printFormatters.count];
	for (UIPrintFormatter *formatter in self.printFormatters)
		if (formatter.startPage <= pageIndex && pageIndex < formatter.startPage + formatter.pageCount)
			[formatters addObject:formatter];
	return formatters;
}

#pragma mark - UIPrintPageRenderer

- (void)prepareForDrawingPages:(NSRange)range
{
}

- (void)drawPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)printableRect
{
	[self drawHeaderForPageAtIndex:pageIndex inRect:CGRectMake(0, 0,
															   printableRect.size.width, self.headerHeight)];
	[self drawContentForPageAtIndex:pageIndex inRect:CGRectMake(0, self.headerHeight,
																printableRect.size.width, printableRect.size.height - self.headerHeight - self.footerHeight)];
	[self drawFooterForPageAtIndex:pageIndex inRect:CGRectMake(0, printableRect.size.height - self.footerHeight,
															   printableRect.size.width, self.footerHeight)];
	for (UIPrintFormatter *formatter in [self printFormattersForPageAtIndex:pageIndex])
		[self drawPrintFormatter:formatter forPageAtIndex:pageIndex];
}
- (void)drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(NSInteger)pageIndex
{
	CGRect formatterRect = [printFormatter rectForPageAtIndex:pageIndex];
	formatterRect = CGRectOffset(formatterRect, -self.printableRect.origin.x, -self.printableRect.origin.y);
	[printFormatter drawInRect:formatterRect forPageAtIndex:pageIndex];
}
- (void)drawHeaderForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)headerRect
{
}
- (void)drawContentForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)contentRect
{
}
- (void)drawFooterForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)footerRect
{
}

@end
