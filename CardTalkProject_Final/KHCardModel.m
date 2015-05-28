//
//  CardModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHCardModel.h"

@implementation KHCardModel

- (void) insertImageFileToImageList:(KHImageFileModel *)imageFile {
    [self.imageList addObject:imageFile];
}

- (instancetype)initWithTitle:(NSString *)title
                      content:(NSString *)textContent
                    imageList:(NSArray *)imageList {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithJsonString:(NSString *)json {
    self = [super init];
    if (self) {
        NSDictionary *cardDict = [self convertJsonToDict:json];
        self = [self initWithCardDict:cardDict];
    }
    
    return self;
}

- (instancetype)initWithCardDict:(NSDictionary *)cardDict {
    self = [super init];
    if (self) {
        _title = cardDict[@"title"];
        _status = (int)[cardDict[@"status"] intValue];
        _partynumber = (int)[cardDict[@"partynumber"] intValue];
        _content = cardDict[@"content"];
        _createtime = cardDict[@"createtime"];
        _articleID = cardDict[@"_id"];
        _imageList = [NSMutableArray arrayWithArray:[KHImageFileModel getImageListFromImageInfoDict:cardDict[@"file"]]];
        _author = [[KHUserModel alloc] initWithUserInfo:cardDict[@"author"]];
        _date = [self convertDateStringToNSDate:_createtime];
    }
    
    return self;
}


- (NSString *)showShortTextContents {
    if (self.content.length > 100) {
        NSString *subString = [self.content substringToIndex:100];
        self.content = [subString stringByAppendingString:@"..."];
    }
    return self.content;
}



@end
