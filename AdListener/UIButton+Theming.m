//
//  UIButton+Theming.m
//  UX-RX
//
//  Created by Rex St John on 1/22/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UIButton+Theming.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (Theming)

-(void)addBorder:(UIColor*)color withWidth:(NSUInteger)width{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

@end
