//
//  KHChatModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHChatModel.h"

@implementation KHChatModel

-(instancetype)initWithJson:(NSString *)json {
    self = [super init];
    if (self) {
        NSDictionary *chatDict = [self convertJsonToDict:json];
        self = [self initWithChatDict:chatDict];
    }
    
    return self;
}

- (instancetype)initWithChatDict:(NSDictionary *)chatDict {
    self = [super init];
    if (self) {
        _content = chatDict[@"content"];
        _articleid = chatDict[@"articleid"];
        _time = chatDict[@"time"];
        _user = [[KHUserModel alloc] initWithUserInfo:chatDict[@"user"]];
        _date = [self convertDateStringToNSDate:_time];
    }
    
    return self;
}

@end
