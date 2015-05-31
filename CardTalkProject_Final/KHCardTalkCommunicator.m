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

- (void)launchConnectionForPosting:(NSURLRequest *)request {
    [self cancleAndDiscardPostingURLConnection];
    postingConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)fetchContentAtURL:(NSURL *)url errorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock {
    fetchingURL = url;
    errorHandler = [errorBlock copy];
    successHandler = [successBlock copy];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: fetchingURL];
    [self setCookieForRequest:request];
    [self launchConnectionForRequest:request];
}

- (void)postContentAtURL:(NSURL *)url postData:(NSData*)postData errorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock {
    postingURL = url;
    errorHandler = [errorBlock copy];
    successHandler = [successBlock copy];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [self setCookieForRequest:request];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self launchConnectionForPosting:request];
    
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

- (void) postCard:(NSDictionary *)cardDict {
    NSData *cardData = [self convertDictToJSONData:cardDict];
    [self postContentAtURL:[NSURL URLWithString:@"http://125.209.195.202:3000/card"]
                  postData:cardData
              errorHandler:^(NSError *error) {
                  [delegate postingForCardsFaildWithError:error];
              }
            successHandler:^(NSString *objectNotation) {
                [delegate finishPostCard:objectNotation];
            }];
}

- (void) postLogin:(NSDictionary *)userInfo {
    NSData *userData = [self convertDictToJSONData:userInfo];
    [self postContentAtURL:[NSURL URLWithString:@"http://125.209.195.202:3000/login"]
                  postData:userData
              errorHandler:^(NSError *error) {
                  [delegate postingForLoginFaildWithError:error];
              }
            successHandler:^(NSString *objectNotation) {
                [delegate finishPostLogin:objectNotation];
            }];
    
    NSLog(@"userInfo %@", userInfo);
}

- (void) postSignUp:(NSDictionary *)userInfo {
    NSData *userData = [self convertDictToJSONData:userInfo];
    [self postContentAtURL:[NSURL URLWithString:@"http://125.209.195.202:3000/login/signup"]
                  postData:userData
              errorHandler:^(NSError *error) {
                  [delegate postingForSignUpFaildWithError:error];
              }
            successHandler:^(NSString *objectNotation) {
                [delegate finishPostSignUp:objectNotation];
            }];
}

- (void) setCookieForRequest:(NSMutableURLRequest *)request {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSDictionary *cookieHeaders = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    NSLog(@"cookies %@", cookies);
    
    NSLog(@"cookie header %@", cookieHeaders);
    [request setValue:[cookieHeaders objectForKey:@"Cookie"] forHTTPHeaderField:@"Set-Cookie"];
}

- (NSData *)convertDictToJSONData:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if (!jsonData) {
        NSLog(@"got an error convertin json data : %@", error);
    }
    return jsonData;
}

- (void)dealloc {
    [fetchingConnection cancel];
}

- (void)cancelAndDiscardURLConnection {
    [fetchingConnection cancel];
    fetchingConnection = nil;
}

- (void)cancleAndDiscardPostingURLConnection{
    [postingConnection cancel];
    postingConnection = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    receivedData = nil;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:[httpResponse allHeaderFields] forURL:response.URL];
    
    if (cookies.count != 0) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:cookies forURL:response.URL mainDocumentURL:nil];
    }
    
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