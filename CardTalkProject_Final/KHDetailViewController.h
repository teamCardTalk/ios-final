//
//  KHDetailViewController.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHCardTalkObjectConfiguration.h"
#import "KHCardTalkDataManager.h"
#import <Realm/Realm.h>

@interface KHDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSObject <UITableViewDelegate, UITableViewDataSource> *dataSource;
@property (strong, nonatomic) KHCardTalkObjectConfiguration *objectConfiguration;
@property (strong, nonatomic) KHCardTalkDataManager *manager;
@property (nonatomic, strong) RLMNotificationToken *dataNotification;
@end
