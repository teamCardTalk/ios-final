//
//  KHBasicModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHBasicModel : NSObject

- (NSDate *)convertDateStringToNSDate:(NSString*)dateString;

- (NSArray *)convertJsonToArray:(NSString *)json;
- (NSDictionary *)convertJsonToDict:(NSString *)json;

@end
