//
//  ECPrintFormatter.h
//  ECUIKit
//
//  Created by Daniel Alm on 25.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "ECUIKit.h"

@class ECPrintPageRenderer;
@interface ECPrintFormatter : NSObject

@property(nonatomic,weak) UIPrintPageRenderer *printPageRenderer; // default is nil. set when formatter added to a print page renderer
- (void)removeFromPrintPageRenderer;

@property(nonatomic) CGFloat      maximumContentHeight;      // default is 0.0. limits content to width
@property(nonatomic) CGFloat      maximumContentWidth;       // default is 0.0. limits content to height
@property(nonatomic) UIEdgeInsets contentInsets;             // default is UIEdgeInsetsZero. from edge of printableRect. applies to whole content. bottom inset unused

@property(nonatomic)          NSInteger startPage;           // default is NSNotFound
@property(nonatomic,readonly) NSInteger pageCount;           // calculated

- (CGRect)rectForPageAtIndex:(NSInteger)pageIndex;                     // returns empty rect if index out of range
- (void)drawInRect:(CGRect)rect forPageAtIndex:(NSInteger)pageIndex;   // override point to add custom drawing

@end
