//
//  UXRHeaderCollectionReuseableView.m
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRHeaderCollectionReuseableView.h"

@implementation UXRHeaderCollectionReuseableView


+ (NSString *)cellIdentifier {
    static NSString* _cellIdentifier = @"UXRHeaderCollectionReuseableView";
    _cellIdentifier = NSStringFromClass([self class]);
    return _cellIdentifier;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    //
}

+(CGSize)sizeForHeaderView{
    return CGSizeMake(529.0f, 1024.0f);
}

-(IBAction)didTapListen:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:LISTEN_REQUEST_NOTIFICATION object:nil];
}

-(IBAction)didTapRewatch:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:REWATCH_REQUEST_NOTIFICATION object:nil];
}

-(IBAction)didTapRedeem:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:REDEEM_REQUEST_NOTIFICATION object:nil];
}

-(IBAction)didTapUserProfile:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:USER_PROFILE_REQUEST_NOTIFICATION object:nil];
}


@end
