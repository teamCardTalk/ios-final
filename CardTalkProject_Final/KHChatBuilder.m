//
//  KHChatBuilder.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHChatBuilder.h"

extern NSString *KHChatBuilderError;
enum {
    KHChatBuilderJSONParsingErrorCode
};

@implementation KHChatBuilder

- (NSArray *)chatsFromJSON:(NSString *)json error:(NSError **)error {
    
    NSParameterAssert(json != nil);
    
    //    if (error != NULL) {
    //        NSError *reportableError = [NSError errorWithDomain:KHCardBuilderError code:KHCardBuilderJSONParsingErrorCode userInfo:nil];
    //        *error = reportableError;
    //    }
    //    return nil;
    
    NSParameterAssert(json != nil);
    NSData *unicodeNotation = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:unicodeNotation options:NSJSONReadingMutableContainers error:&localError];
    NSArray *parsedObject = (id)jsonObject;
    if (parsedObject == nil) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:KHChatBuilderError code:KHChatBuilderJSONParsingErrorCode userInfo:[NSDictionary dictionaryWithObject:localError forKey:NSLocalizedFailureReasonErrorKey]];
        }
        return nil;
    }
    NSMutableArray *chatModelList = [[NSMutableArray alloc] init];
    for (NSDictionary *chatDict in parsedObject) {
        KHChatModel *chat = [[KHChatModel alloc] initWithChatDict:chatDict];
        [chatModelList addObject:chat];
    }
    return chatModelList;
    // 형식상 안맞는 에러코드 나와야 함..
}

@end

NSString *KHChatBuilderError = @"KHChatBuilderError";
