//
//  UXRGlobals.h
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UXRGlobals : NSObject
extern NSString* TESTFLIGHT_TOKEN;

// notifications
extern NSString* LISTEN_REQUEST_NOTIFICATION;
extern NSString* REDEEM_REQUEST_NOTIFICATION;
extern NSString* REWATCH_REQUEST_NOTIFICATION;
extern NSString* USER_PROFILE_REQUEST_NOTIFICATION;

// segues.
extern NSString* WATCH_AD_SEGUE;
extern NSString* REDEEM_SEGUE;
extern NSString* LISTEN_SEGUE;
extern NSString* AD_DETECTED_SEGUE;
extern NSString* USER_PROFILE_SEGUE;

@end
