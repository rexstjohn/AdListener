//
//  UXRUserInfoHeaderView.m
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRUserInfoHeaderView.h"

@implementation UXRUserInfoHeaderView

+ (NSString *)viewIdentifier {
    static NSString* _viewIdentifier = @"UXRUserInfoHeaderView";
    _viewIdentifier = NSStringFromClass([self class]);
    return _viewIdentifier;
}

@end
