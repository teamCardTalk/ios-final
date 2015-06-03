//
//  CardModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBasicModel.h"
#import "KHUserModel.h"
#import "KHRoomModel.h"
#import "KHImageFileModel.h"


@interface KHCardModel : KHBasicModel

@property (nonatomic, strong) NSString *content, *createtime, *title, *articleID;
@property (nonatomic) int partynumber, status;
@property (nonatomic,strong) NSMutableArray *imageList;
@property (nonatomic, strong) KHUserModel *author;
@property (nonatomic, strong) NSDate *date;



- (instancetype)initWithJsonString:(NSString *)json;
- (instancetype)initWithTitle:(NSString*)title
                      content:(NSString*)textContent
                    imageList:(NSArray*)imageList;
- (instancetype)initWithCardDict:(NSDictionary *)cardDict;

- (NSString *)showShortTextContents;
- (void)insertImageFileToImageList:(KHImageFileModel *)imageName;

@end
