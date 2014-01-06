//
//  UXRHeaderCollectionReuseableView.h
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRBaseCollectionReuseableView.h"
#import "UXRUserInfoHeaderView.h"

@interface UXRHeaderCollectionReuseableView : UXRBaseCollectionReuseableView
@property(nonatomic,strong) UXRUserInfoHeaderView *userInfoView;
@end
