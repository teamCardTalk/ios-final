//
//  KHMainTableViewDataSource.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KHCardModel.h"
#import <Realm/Realm.h>
#import "KHImageStore.h"
#import "KHMainImageViewCell.h"
#import "KHUserModel.h"
#import "KHImageFileModel.h"


@interface KHMainTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *cards;
@property (strong) KHImageStore *imageStore;
@property (weak) UITableView *tableView;
@property (strong) NSNotificationCenter *notificationCenter;

- (void)registerForUpdatesToImageStore:(KHImageStore*) imageStore;
- (void)removeObservationOfUpdatesToImageStore:(KHImageStore *)imageStore;

@end
