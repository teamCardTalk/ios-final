//
//  KHImageCommunicator.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHImageCommunicator.h"

@implementation KHImageCommunicator

- (void)fetchDataForURL:(NSURL *)location {
    self.url = location;
    NSURLRequest *request = [NSURLRequest requestWithURL:location];
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.delegate communicatorReceivedData:[self.receivedData copy] forURL:self.url];
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.receivedData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self.delegate communicatorGotErrorForURL:self.url];
}

@end
