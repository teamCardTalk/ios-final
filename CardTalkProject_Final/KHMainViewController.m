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
    self.dataSource.imageStore = self.objectConfiguration.imageStore;
    self.dataSource.cards = [[NSMutableArray alloc] init];
    self.dataSource.tableView = self.tableView;
    self.dataSource.notificationCenter = [NSNotificationCenter defaultCenter];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    [self.dataSource registerForUpdatesToImageStore:self.dataSource.imageStore];
    
    [self registerAllNotificationHandler];
    [self.manager fetchCards];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Register Notification

- (void)registerAllNotificationHandler {
    [self registerLoginFailNotificationHandler];
    [self registerImageUpdateNotificationHandler];
}

- (void)registerLoginFailNotificationHandler {
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(loadLoginView:)
     name:@"login fail"
     object:nil];
}

- (void)registerImageUpdateNotificationHandler {
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(receivedImage:)
     name:ImageStoreDidUpdateContentNotification
     object:nil];
}

#pragma mark - Notification Handler

- (void)loadLoginView:(NSNotification *)notification {
    // fetch 실패시.
    KHLoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    loginViewController.manager = self.objectConfiguration.kHCardTlakDatamanager;
    loginViewController.mainManager = self.manager;
    [loginViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:loginViewController animated:YES completion:nil];
}

- (void)receivedImage:(NSNotification *)notification {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - Segue


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KHDetailViewController *detailTableViewController = [segue destinationViewController];
        KHDetailTableViewDataSource *detailDataSource = [[KHDetailTableViewDataSource alloc] init];
        detailTableViewController.dataSource = detailDataSource;
        detailTableViewController.objectConfiguration = self.objectConfiguration;
        detailDataSource.card = self.dataSource.cards[indexPath.row];
        //datasource 설정, 등
    }
}

#pragma mark - KHCardTalkDataManagerDelegate


- (void)fetchingCardsFailedWithError:(NSError *)error {
    
}

- (void)didReceiveCards:(NSArray *)cards {
    self.dataSource.cards = [NSArray arrayWithArray:cards];
    [self.tableView reloadData];
}

@end
