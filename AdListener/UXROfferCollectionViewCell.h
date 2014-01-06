//
//  UXRHomeCollectionViewCell.h
//  AdListener
//
//  Created by Rex St. John on 1/3/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRSmartCollectionViewCell.h"
#import "UXRLabel.h"
#import "UXRButton.h"

@interface UXROfferCollectionViewCell : UXRSmartCollectionViewCell
@property (weak, nonatomic) IBOutlet UXRLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UXRButton *subscribeButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
