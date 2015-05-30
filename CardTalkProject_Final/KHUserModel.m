//
//  KHAuthorModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHUserModel.h"

@implementation KHUserModel

-(instancetype)initWithUserInfo:(NSDictionary *)userInfo {
    self = [super init];
    if (self) {
        _nickname = userInfo[@"nickname"];
        _iconName = userInfo[@"icon"];
    }
    
    return self;
}

@end
