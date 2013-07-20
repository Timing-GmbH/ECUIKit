//
//  NSTableView+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 20.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTableView (ECUIKit)

- (void)scrollRowToVisible:(NSInteger)rowIndex
				  animated:(BOOL)animated;

@end
