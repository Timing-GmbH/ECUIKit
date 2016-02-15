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
	return (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
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

UIImage *ECDrawImageUsingBlock(CGSize size, BOOL opaque, CGFloat scale, void (^drawBlock)())
{
#if TARGET_OS_IPHONE
	UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
	if (drawBlock)
		drawBlock();
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
#else
	NSImage *image = [[NSImage alloc] initWithSize:size];
	NSBitmapImageRep *rep = [[NSBitmapImageRep alloc]
							 initWithBitmapDataPlanes:NULL
							 pixelsWide:size.width
							 pixelsHigh:size.height
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
#endif
	return image;
}

NSData *ECDrawPDFUsingBlock(CGSize size, void (^drawBlock)())
{
	NSMutableData *data = [NSMutableData data];
	CGRect pdfRect = (CGRect){ CGPointZero, size };
#if TARGET_OS_IPHONE
	UIGraphicsBeginPDFContextToData(data,
									pdfRect,
									nil);
	UIGraphicsBeginPDFPage();
	if (drawBlock)
		drawBlock();
	UIGraphicsEndPDFContext();
#else
	CGDataConsumerRef dataConsumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
	CGContextRef context = CGPDFContextCreate(dataConsumer, &pdfRect, NULL);
	CGPDFContextBeginPage(context, NULL);

	UIGraphicsPushContext(context);
	CGContextTranslateCTM(context, 0, size.height);
	CGContextScaleCTM(context, 1, -1);
	if (drawBlock)
		drawBlock();
	UIGraphicsPopContext();

	[NSGraphicsContext restoreGraphicsState];

	CGPDFContextEndPage(context);
	CGPDFContextClose(context);
	CGContextRelease(context);
	CGDataConsumerRelease(dataConsumer);
#endif
	return data;
}
