//
//  MockKHCardBuilder.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "FakeKHCardBuilder.h"

@implementation FakeKHCardBuilder



- (NSArray *)cardsFromJSON:(NSString *)json error:(NSError *__autoreleasing *)error {
    
    self.JSON = json;
    *error = self.errorToSet;
    return self.arrayToReturn;
}

@end
