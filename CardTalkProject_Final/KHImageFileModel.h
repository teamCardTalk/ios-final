//
//  KHImageFile.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"

@interface KHImageFileModel : KHBasicModel

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *name;

+(NSArray *)getImageListFromImageInfoDict:(NSArray *) imageInfos;
-(instancetype)initWithImageInfo:(NSDictionary *)imageInfo;
-(NSString *)getFileName;

@end
