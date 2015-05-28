//
//  KHBasicModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"

@implementation KHBasicModel

- (NSDictionary *) convertJsonToDict:(NSString *)json {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    
    return dict;
}

- (NSArray *)convertJsonToArray:(NSString *)json {
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                                                     options:NSJSONReadingMutableContainers
                                                       error:nil];
    return array;
}

- (NSDate *)convertDateStringToNSDate:(NSString*) dateString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"yy-MM-dd HH:mm";
    NSDate *date = [dateFormat dateFromString:dateString];
    
    return date;
}

@end
