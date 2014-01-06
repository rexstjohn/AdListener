//
//  UXRUserInfoHeaderView.m
//  AdListener
//
//  Created by Rex St. John on 1/5/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRUserInfoHeaderView.h"

@implementation UXRUserInfoHeaderView

+ (NSString *)viewIdentifier {
    static NSString* _viewIdentifier = @"UXRUserInfoHeaderView";
    _viewIdentifier = NSStringFromClass([self class]);
    return _viewIdentifier;
}

-(IBAction)didTapListen:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LISTEN_NOTIFICATION" object:nil];
}

-(IBAction)didTapRewatch:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"REWATCH_NOTIFICATION" object:nil];
}

-(IBAction)didTapRedeem:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"REDEEM_NOTIFICATION" object:nil];
}
@end
