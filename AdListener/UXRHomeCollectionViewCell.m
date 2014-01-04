//
//  UXRHomeCollectionViewCell.m
//  AdListener
//
//  Created by Rex St. John on 1/3/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRHomeCollectionViewCell.h"

@implementation UXRHomeCollectionViewCell

+ (NSString *)cellIdentifier {
    static NSString* _cellIdentifier = @"UXRHomeCollectionViewCell";
    _cellIdentifier = NSStringFromClass([self class]);
    return _cellIdentifier;
}

@end
