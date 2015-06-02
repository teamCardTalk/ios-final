//
//  KHRealmCardModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 2..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHRealmCardModel.h"

@implementation KHRealmCardModel

-(instancetype)initWithCardDict:(NSDictionary *)cardDict {
    self = [super init];
    if (self) {
        _title = cardDict[@"title"];
        _status = (int)[cardDict[@"status"] intValue];
        _partynumber = (int)[cardDict[@"partynumber"] intValue];
        _content = cardDict[@"content"];
        _createtime = cardDict[@"createtime"];
        _articleID = cardDict[@"_id"];

        _author = [[KHUserModel alloc] initWithUserInfo:cardDict[@"author"]];
        _date = [NSDate date];
        //_room = [[KHRoomModel alloc] initWithCard:self];
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title createTime:(NSString *)createTiem userId:(NSString *)userid imageData:(NSData *)imageData {
    self = [super init];
    if (self) {
        _title = title;
        _createtime = createTiem;
        _author = [[KHUserModel alloc] init];
        _author.userid = userid;
        _author.nickname = userid;
        _author.iconName = @"";
        _imageData = imageData;
        _articleID = [self getUUID];
        _partynumber = 0;
        _date = [NSDate date];
    }
    
    return self;
}

- (UIImage *)getImage {
    UIImage *image = [UIImage imageWithData:self.imageData];
    return image;
}


- (NSString *)getUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}


@end
