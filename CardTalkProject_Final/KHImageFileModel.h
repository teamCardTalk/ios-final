//
//  KHImageFile.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"
#import <Realm/Realm.h>

@interface KHImageFileModel : RLMObject

@property NSString *path;
@property NSString *name;
@property NSData *imageData;

+(NSArray *)getImageListFromImageInfoDict:(NSArray *) imageInfos;
-(instancetype)initWithImageInfo:(NSDictionary *)imageInfo;
-(NSString *)getFileName;

@end

RLM_ARRAY_TYPE(KHImageFileModel)
