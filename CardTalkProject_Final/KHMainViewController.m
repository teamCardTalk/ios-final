//
//  KHMainViewController.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHMainViewController.h"


@interface KHMainViewController ()

@end

@implementation KHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    self.dataSource = [[KHMainTableViewDataSource alloc] init];
    self.objectConfiguration = [[KHCardTalkObjectConfiguration alloc] init];
    self.manager = [self.objectConfiguration kHCardTlakDatamanager];
    self.manager.delegate = self;
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.manager fetchCards];
    // loginView
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // login view 넣어야함
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Register Notification

#pragma mark - Notification Handler

#pragma mark - Segue


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KHDetailViewController *detailTableViewController = [segue destinationViewController];
        KHDetailTableViewDataSource *detailDataSource = [[KHDetailTableViewDataSource alloc] init];
        detailTableViewController.dataSource = detailDataSource;
        detailTableViewController.objectConfiguration = self.objectConfiguration;
        detailDataSource.card = self.cards[indexPath.row];
        //datasource 설정, 등
    }
}

#pragma mark - KHCardTalkDataManagerDelegate


- (void)fetchingCardsFailedWithError:(NSError *)error {
    
}

- (void)didReceiveCards:(NSArray *)cards {
    self.cards = [NSMutableArray arrayWithArray:cards];
    [self.tableView reloadData];
}

@end
