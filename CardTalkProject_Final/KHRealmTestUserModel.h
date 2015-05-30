//
//  KHRealmTestUserModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "RLMObject.h"

@interface KHRealmTestUserModel : RLMObject

@property NSString *nickname;
@property NSString *iconURL;

@end
RLM_ARRAY_TYPE(KHRealmTestUserModel)
