//
//  NSString+Utils.h
//  UX-RX
//
//  Created by Rex St John on 1/10/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

+(NSString *)join:(NSArray *)strings andSeperator:( NSString *)separator;
+(NSArray *)split:(NSString *)s andSeperator:(NSString *)separator;
+(int) indexOf:(NSString *)haystack andSubString:(NSString *)needle;
+(BOOL) contains:(NSString *)haystack andSubString:(NSString *)needle;
+(BOOL) startsWith:(NSString *)haystack andSubString:( NSString *)needle;

@end
