//
//  UXRRedeemCollectionReusableView.m
//  AdListener
//
//  Created by Rex St. John on 1/6/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRRedeemCollectionReusableView.h"

@implementation UXRRedeemCollectionReusableView

+ (NSString *)cellIdentifier {
    static NSString* _cellIdentifier = @"UXRRedeemCollectionReusableView";
    _cellIdentifier = NSStringFromClass([self class]);
    return _cellIdentifier;
}

@end
