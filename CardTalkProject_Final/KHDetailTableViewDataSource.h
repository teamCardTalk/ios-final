//
//  KHDetailTableViewDataSource.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KHCardModel.h"

@interface KHDetailTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) KHCardModel *card;

@end
