//
//  UXRHeaderCollectionReuseableView.m
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRHeaderCollectionReuseableView.h"

@implementation UXRHeaderCollectionReuseableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.userInfoView = [[UXRUserInfoHeaderView alloc] initWithFrame:self.frame];
    [self addSubview:self.userInfoView];
}

+(CGSize)sizeForHeaderView{
    return CGSizeMake(529.0f, 600.0f);
}

@end
