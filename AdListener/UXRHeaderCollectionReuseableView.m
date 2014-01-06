//
//  UXRHeaderCollectionReuseableView.m
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRHeaderCollectionReuseableView.h"

@implementation UXRHeaderCollectionReuseableView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.userInfoView = [[UXRUserInfoHeaderView alloc] initWithFrame:self.frame];
    [self addSubview:self.userInfoView];
    self.userInfoView.center = self.center;
    self.userInteractionEnabled = YES;
    self.userInfoView.userInteractionEnabled = YES;
}

+(CGSize)sizeForHeaderView{
    return CGSizeMake(529.0f, 1024.0f);
}

@end
