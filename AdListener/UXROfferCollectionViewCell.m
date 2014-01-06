//
//  UXRHomeCollectionViewCell.m
//  AdListener
//
//  Created by Rex St. John on 1/3/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXROfferCollectionViewCell.h"

@implementation UXROfferCollectionViewCell

+ (NSString *)cellIdentifier {
    static NSString* _cellIdentifier = @"UXROfferCollectionViewCell";
    _cellIdentifier = NSStringFromClass([self class]);
    return _cellIdentifier;
}

-(IBAction)didTapSubscribe:(id)sender{
    
    if([self.subscribeButton.titleLabel.text isEqualToString:@"Subscribe"]==YES){
        [self.subscribeButton setTitle:@"Subcsribed" forState:UIControlStateNormal];
        self.subscribeButton.alpha = .5;
    } else {
        [self.subscribeButton setTitle:@"Subcsribe" forState:UIControlStateNormal];
        self.subscribeButton.alpha = 1;
    }
}

@end
