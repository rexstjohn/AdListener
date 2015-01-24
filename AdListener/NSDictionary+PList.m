//
//  NSDictionary+PList.m
//  UX-RX
//
//  Created by Rex St John on 6/7/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "NSDictionary+PList.h"

@implementation NSDictionary (PList)  

+(NSDictionary*)dictionaryFromPlistWithName:(NSString*)plistName{
    // Path to the plist (in the application bundle)
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      plistName ofType:@"plist"];
    
    return [[NSDictionary alloc] initWithContentsOfFile:path];
}
 
@end
