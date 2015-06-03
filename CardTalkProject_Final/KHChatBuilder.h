//
//  KHChatBuilder.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHChatModel.h"

@interface KHChatBuilder : NSObject

@property (copy) NSString *JSON;
@property (copy) NSArray *arrayToReturn;
@property (copy) NSError *errorToSet;


- (NSArray *) chatsFromJSON: (NSString *)json error:(NSError **)error;


@end
