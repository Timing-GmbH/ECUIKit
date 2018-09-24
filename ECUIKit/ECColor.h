//
//  ECColor.h
//  ECUIKit
//
//  Created by Daniel Alm on 23.09.18.
//  Copyright © 2018 EUROCOMP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ECUIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ECUIKit)

@property(class, nonatomic, readonly) UIColor *ec_systemRedColor;
@property(class, nonatomic, readonly) UIColor *ec_systemBlueColor;

@property(class, nonatomic, readonly) UIColor *ec_textColor;
@property(class, nonatomic, readonly) UIColor *ec_secondaryLabelColor;

@end

NS_ASSUME_NONNULL_END
