//
//  KHCardTalkCommunicator.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHCardTalkCommunicator.h"

@interface KHCardTalkCommunicator ()

- (void)fetchContentAtURL: (NSURL *)url errorHandler: (void(^)(NSError *error))errorBlock successHandler: (void(^)(NSString *objectNotation)) successBlock;
- (void)launchConnectionForRequest: (NSURLRequest *)request;

@end


@implementation KHCardTalkCommunicator

@synthesize delegate;

- (void)launchConnectionForRequest:(NSURLRequest *)request {
    [self cancelAndDiscardURLConnection];
    fetchingConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)fetchContentAtURL:(NSURL *)url errorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock {
    fetchingURL = url;
    errorHandler = [errorBlock copy];
    successHandler = [successBlock copy];
    NSURLRequest *request = [NSURLRequest requestWithURL: fetchingURL];
    
    [self launchConnectionForRequest:request];
}

- (void) searchForRecentCards {
    [self fetchContentAtURL:[NSURL URLWithString:@"http://125.209.195.202:3000/card/all"]
               errorHandler:^(NSError *error) {
                   [delegate searchingForCardsFailedWithError:error];
               }
             successHandler:^(NSString *objectNotation) {
                 [delegate receivedCardJSON:objectNotation];
             }];
}

- (void)dealloc {
    [fetchingConnection cancel];
}

- (void)cancelAndDiscardURLConnection {
    [fetchingConnection cancel];
    fetchingConnection = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    receivedData = nil;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if ([httpResponse statusCode] != 200) {
        NSError *error = [NSError errorWithDomain:KHCardTalkCommunicatorErrorDomain code:[httpResponse statusCode] userInfo:nil];
        errorHandler(error);
        [self cancelAndDiscardURLConnection];
    } else {
        receivedData = [[NSMutableData alloc] init];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    receivedData = nil;
    fetchingConnection = nil;
    fetchingURL = nil;
    errorHandler(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    fetchingConnection = nil;
    fetchingURL = nil;
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    receivedData = nil;
    successHandler(receivedText);
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}




@end


NSString *KHCardTalkCommunicatorErrorDomain = @"KHCardTalkCommunicatorErrorDomain";