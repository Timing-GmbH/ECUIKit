//
//  NSFont+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 02.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSFont (ECUIKit)

@property (nonatomic, readonly) CGFloat lineHeight;

- (NSFont *)fontWithSize:(CGFloat)size;

@end
