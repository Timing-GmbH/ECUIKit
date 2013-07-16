//
//  NSOpenGLContext+ECUIKit.h
//  ECUIKit
//
//  Created by Daniel Alm on 16.07.13.
//  Copyright (c) 2013 EUROCOMP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSOpenGLContext (ECUIKit)

+ (void)setCurrentContext:(NSOpenGLContext *)context;

@end
