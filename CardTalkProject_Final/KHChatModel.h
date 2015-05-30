//
//  KHChatModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "KHUserModel.h"

@interface KHChatModel : RLMObject

@property KHUserModel *user;
@property NSString *content;
@property NSString *time;
@property NSString *articleid;
@property NSDate *date;

- (instancetype)initWithJson:(NSString *)json;
- (instancetype)initWithChatDict:(NSDictionary *)chatDict;

@end

RLM_ARRAY_TYPE(KHChatModel)
