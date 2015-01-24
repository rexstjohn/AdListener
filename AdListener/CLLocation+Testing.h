//
//  CLLocation+Testing.h
//  UX-RX
//
//  Created by Rex St John on 2/8/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (Testing)

+(CLLocation*)locationInSeattle;
+(CLLocation*)locationInNewYork;
+(CLLocation*)locationInSanFransisco;
+(CLLocation*)locationInBoston;
+(CLLocation*)locationInMiami;
+(CLLocation*)locationInLondon;
+(CLLocation*)randomMajorCity;

@end
