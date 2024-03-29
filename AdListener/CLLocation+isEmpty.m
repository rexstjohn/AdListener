//
//  CLLocation+isEmpty.m
//  UX-RX
//
//  Created by JASON CROSS on 3/21/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "CLLocation+isEmpty.h"

@implementation CLLocation (isEmpty)

+ (BOOL) isEmpty:(CLLocation*)thing; {
    return (nil == thing) || (thing.coordinate.latitude == 0)  || (thing.coordinate.longitude == 0);
}

@end
