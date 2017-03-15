//
//  IDFAInKeyChain.h
//  IDFAInKeyChain
//
//  Created by yhw on 17/3/15.
//  Copyright © 2017年 yhw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDFAInKeyChain : NSObject

// Fetch IDFA in KeyChain
+ (NSString *)IDFA;
+ (NSString *)IDFA:(NSString *)service;

// Remove IDFA in KeyChain
+ (BOOL)removeIDFA;
+ (BOOL)removeIDFA:(NSString *)service;

@end
