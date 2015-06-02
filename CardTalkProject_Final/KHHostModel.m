//
//  KHHostModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 31..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHHostModel.h"

@implementation KHHostModel

- (instancetype)initWithUserInfo:(NSDictionary *)userInfo {
    self = [super init];
    if (self) {
        [self removeHostFromRealm];
        
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        NSDictionary *cookieHeaders = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        NSString *cookieValue = [cookieHeaders objectForKey:@"Cookie"];
        _userid = userInfo[@"userid"];
        _nickname = userInfo[@"nickname"];
        _uid = userInfo[@"uid"];
        _icon = userInfo[@"icon"];
        _deviceType = userInfo[@"deviceType"];
        _cookie = cookieValue;
    }
    return self;
}


- (void)removeHostFromRealm {
    RLMResults *hosts = [KHHostModel allObjects];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    if (hosts.count) {
        [realm beginWriteTransaction];
        [realm deleteObjects:hosts];
        [realm commitWriteTransaction];
    }
}

- (void)saveHost {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:self];
    [realm commitWriteTransaction];
}

@end
