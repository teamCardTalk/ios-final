//
//  KHRealmCardModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 2..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "RLMObject.h"
#import "KHImageFileModel.h"
#import "KHUserModel.h"

@interface KHRealmCardModel : RLMObject



@property NSString *content, *createtime, *title, *articleID;
@property int partynumber, status;

@property KHUserModel *author;
@property NSDate *date;
@property NSData *imageData;

- (instancetype)initWithCardDict:(NSDictionary *)cardDict;
- (instancetype)initWithTitle:(NSString *)title createTime:(NSString *)createTiem userId:(NSString *)userid imageData:(NSData *)imageData;
- (UIImage *)getImage;
@end
