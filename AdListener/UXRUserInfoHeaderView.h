//
//  UXRUserInfoHeaderView.h
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRSmartView.h"
#import "UXRButton.h"
@interface UXRUserInfoHeaderView : UXRSmartView
@property(nonatomic,weak) IBOutlet UXRButton *redeemButton;
@property(nonatomic,weak) IBOutlet UXRButton *rewatchButton;
@end
