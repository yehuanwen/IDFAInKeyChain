//
//  IDFAInKeyChain.m
//  IDFAInKeyChain
//
//  Created by yhw on 17/3/15.
//  Copyright © 2017年 yhw. All rights reserved.
//

#import "IDFAInKeyChain.h"
#import "UICKeyChainStore.h"
#import <AdSupport/AdSupport.h>

static NSString * const IDFAInKeyChainService = @"idfa.keychain.service";
static NSString * const IDFAInKeyChainKey = @"idfa.keychain.key";

@implementation IDFAInKeyChain

+ (NSString *)IDFA {
    return [self IDFA:IDFAInKeyChainService];
}

+ (NSString *)IDFA:(NSString *)service {
    UICKeyChainStore *keyChainStore = [UICKeyChainStore keyChainStoreWithService:service];
    NSString *idfa = [keyChainStore stringForKey:IDFAInKeyChainKey];
    if (!idfa || idfa.length == 0) {
        if ([ASIdentifierManager sharedManager].advertisingTrackingEnabled)
        {
            idfa = [[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString];
            if (![UICKeyChainStore setString:idfa forKey:IDFAInKeyChainKey]) {
                NSLog(@"fail to save idfa in keychain");
            };
        }
    }
    return idfa;
}

+ (BOOL)removeIDFA {
    return [self removeIDFA:IDFAInKeyChainService];
}

+ (BOOL)removeIDFA:(NSString *)service {
    UICKeyChainStore *keyChainStore = [UICKeyChainStore keyChainStoreWithService:service];
    return [keyChainStore setString:nil forKey:IDFAInKeyChainKey];
}

@end
