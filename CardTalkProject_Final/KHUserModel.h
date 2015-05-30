//
//  KHAuthorModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"
#import "RLMObject.h"

@interface KHUserModel : RLMObject

@property NSString *nickname;
@property NSString *iconName;
@property NSString *userid;

- (instancetype) initWithUserInfo:(NSDictionary *)userInfo;

@end

RLM_ARRAY_TYPE(KHUserModel)
