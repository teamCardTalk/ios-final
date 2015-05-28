//
//  KHImageFile.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHImageFileModel.h"

@implementation KHImageFileModel

-(instancetype)initWithImageInfo:(NSDictionary *)imageInfo {
    self = [super init];
    if (self) {
        _path = imageInfo[@"path"];
        _name = imageInfo[@"name"];
    }
    
    return self;
}

+(NSArray *)getImageListFromImageInfoDict:(NSArray *) imageInfos {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSDictionary *imageInfo in imageInfos) {
        KHImageFileModel *image = [[KHImageFileModel alloc] initWithImageInfo:imageInfo];
        [result addObject:image];
    }
    
    return result;
}

-(NSString *)getFileName {
    
    NSArray *results = [self.path componentsSeparatedByString:@"/"];
    return [results lastObject];
}

@end
