//
//  UXRHeaderCollectionReuseableView.h
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRSmartCollectionReuseableView.h"
#import "UXRButton.h"

@interface UXRHeaderCollectionReuseableView : UXRSmartCollectionReuseableView

@property(nonatomic,weak) IBOutlet UXRButton *redeemButton;
@property(nonatomic,weak) IBOutlet UXRButton *rewatchButton;
+(CGSize)sizeForHeaderView;

@end
