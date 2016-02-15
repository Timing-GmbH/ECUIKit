//
//  NSScrollView+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 08.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ECScrollView : NSScrollView

@property (readwrite) CGSize contentSize;
@property (readwrite) CGPoint contentOffset;

@end
