//
//  NSTableView+ECUIKit.m
//  ECUIKit
//
//  Created by Daniel Alm on 20.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import "NSTableView+ECUIKit.h"

@implementation NSTableView (ECUIKit)

- (void)scrollRowToVisible:(NSInteger)rowIndex
				  animated:(BOOL)animated
{
    if (animated){
        NSRect rowRect = [self rectOfRow:rowIndex];
        NSPoint scrollOrigin = rowRect.origin;
        NSClipView *clipView = (NSClipView *)[self superview];
        scrollOrigin.y += MAX(0, round((NSHeight(rowRect) - NSHeight(clipView.frame)) * 0.5f));
        [[clipView animator] setBoundsOrigin:scrollOrigin];
    }
	else
        [self scrollRowToVisible:rowIndex];
}

@end
