//
//  KHCardBuilder.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHCardBuilder : NSObject

@property (copy) NSString *JSON;
@property (copy) NSArray *arrayToReturn;
@property (copy) NSError *errorToSet;


- (NSArray *) cardsFromJSON: (NSString *)json error:(NSError **)error;

@end
