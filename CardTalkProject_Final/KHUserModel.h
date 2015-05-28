//
//  KHAuthorModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"

@interface KHUserModel : KHBasicModel

@property (nonatomic, strong) NSString *nickname, *icon;

- (instancetype) initWithUserInfo:(NSDictionary *)userInfo;

@end
