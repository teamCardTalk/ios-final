//
//  KHCardBuilder.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHCardBuilder.h"
#import "KHCardModel.h"

@implementation KHCardBuilder

extern NSString *KHCardBuilderError;
enum {
    KHCardBuilderJSONParsingErrorCode
};


- (NSArray *)cardsFromJSON:(NSString *)json error:(NSError **)error {
    
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
            *error = [NSError errorWithDomain:KHCardBuilderError code:KHCardBuilderJSONParsingErrorCode userInfo:[NSDictionary dictionaryWithObject:localError forKey:NSLocalizedFailureReasonErrorKey]];
        }
        return nil;
    }
    NSMutableArray *cardModelList = [[NSMutableArray alloc] init];
    for (NSDictionary *cardDict in parsedObject) {
        KHCardModel *card = [[KHCardModel alloc] initWithCardDict:cardDict];
        [cardModelList insertObject:card atIndex:0];
    }
    return cardModelList;
    // 형식상 안맞는 에러코드 나와야 함..
}

@end

NSString *KHCardBuilderError = @"KHCardBuilderError";
