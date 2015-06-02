//
//  KHDetailViewCell.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 1..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHMainImageViewCell.h"

@interface KHDetailViewCell : KHMainImageViewCell

- (void)cellConfiguration;
- (void)mainImageViewConfiguration:(UIImage *)image;
- (void)iconImageViewConfiguration:(UIImage *)image;

@end
