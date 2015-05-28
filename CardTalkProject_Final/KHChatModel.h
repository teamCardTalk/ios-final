//
//  KHChatModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHUserModel.h"

@interface KHChatModel : KHBasicModel

@property (nonatomic, strong) NSString *articleid, *content, *time;
@property (nonatomic, strong) KHUserModel *user;
@property (nonatomic, strong) NSDate *date;

- (instancetype)initWithJson:(NSString *)json;
- (instancetype)initWithChatDict:(NSDictionary *)chatDict;

@end
