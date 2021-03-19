//
//  ECCoreGraphics.m
//  ECUIKit
//
//  Created by Daniel Alm on 15.02.16.
//  Copyright © 2016 EUROCOMP. All rights reserved.
//

#import "ECCoreGraphics.h"

#if !TARGET_OS_IPHONE

CGContextRef UIGraphicsGetCurrentContext()
{
	return (CGContextRef)[NSGraphicsContext currentContext].graphicsPort;
}

void UIGraphicsPushContext(CGContextRef context)
{
	[NSGraphicsContext saveGraphicsState];
	NSGraphicsContext *nscg = [NSGraphicsContext graphicsContextWithGraphicsPort:context flipped:YES];
	[NSGraphicsContext setCurrentContext:nscg];
}

void UIGraphicsPopContext()
{
	[NSGraphicsContext restoreGraphicsState];
}

#endif

UIImage *ECDrawImageUsingBlock(CGSize size, BOOL opaque, CGFloat scale, ECUIKitDrawingBlock drawBlock)
{
#if TARGET_OS_IPHONE
	UITraitCollection *previousTraitCollection;
	if (@available(iOS 13.0, *)) {
		previousTraitCollection = UITraitCollection.currentTraitCollection;
		UITraitCollection.currentTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
	}
	
	UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
	[[UIColor whiteColor] setFill];
	CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height));
	if (drawBlock)
		drawBlock();
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	if (@available(iOS 13.0, *)) {
		UITraitCollection.currentTraitCollection = previousTraitCollection;
	}
#else
	NSAppearance *previousAppearance = NSAppearance.currentAppearance;
	if (@available(macOS 10.14, *)) {
		NSAppearance.currentAppearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];
	}

	NSImage *image = [[NSImage alloc] initWithSize:size];
	NSBitmapImageRep *rep = [[NSBitmapImageRep alloc]
							 initWithBitmapDataPlanes:NULL
							 pixelsWide:size.width ?: 1
							 pixelsHigh:size.height ?: 1
							 bitsPerSample:8
							 samplesPerPixel:(opaque ? 3 : 4)
							 hasAlpha:!opaque
							 isPlanar:NO
							 colorSpaceName:NSCalibratedRGBColorSpace
							 bytesPerRow:0
							 bitsPerPixel:0];

	[image addRepresentation:rep];

	[image lockFocus];

	CGContextRef context = UIGraphicsGetCurrentContext();
	UIGraphicsPushContext(context);
	CGContextTranslateCTM(context, 0, size.height);
	CGContextScaleCTM(context, 1, -1);
	if (drawBlock)
		drawBlock();
	UIGraphicsPopContext();

	[image unlockFocus];

	if (@available(macOS 10.14, *)) {
		NSAppearance.currentAppearance = previousAppearance;
	}
#endif
	return image;
}

NSData *ECDrawPDFUsingBlock(CGSize size, ECUIKitDrawingBlock drawBlock)
{
	NSMutableData *data = [NSMutableData data];
	CGRect pdfRect = (CGRect){ CGPointZero, size };
#if TARGET_OS_IPHONE
	UITraitCollection *previousTraitCollection;
	if (@available(iOS 13.0, *)) {
		previousTraitCollection = UITraitCollection.currentTraitCollection;
		UITraitCollection.currentTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
	}
	
	UIGraphicsBeginPDFContextToData(data,
									pdfRect,
									nil);
	UIGraphicsBeginPDFPage();
	if (drawBlock)
		drawBlock();
	UIGraphicsEndPDFContext();
	
	if (@available(iOS 13.0, *)) {
		UITraitCollection.currentTraitCollection = previousTraitCollection;
	}
#else
	NSAppearance *previousAppearance = NSAppearance.currentAppearance;
	if (@available(macOS 10.14, *)) {
		NSAppearance.currentAppearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];
	}

	CGDataConsumerRef dataConsumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
	CGContextRef context = CGPDFContextCreate(dataConsumer, &pdfRect, NULL);
	CGPDFContextBeginPage(context, NULL);

	UIGraphicsPushContext(context);
	CGContextTranslateCTM(context, 0, size.height);
	CGContextScaleCTM(context, 1, -1);
	if (drawBlock)
		drawBlock();
	UIGraphicsPopContext();

	CGPDFContextEndPage(context);
	CGPDFContextClose(context);
	CGContextRelease(context);
	CGDataConsumerRelease(dataConsumer);

	if (@available(macOS 10.14, *)) {
		NSAppearance.currentAppearance = previousAppearance;
	}
#endif
	return data;
}
