//
//  KHDetailViewController.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHDetailViewController.h"

@interface KHDetailViewController ()

@end

@implementation KHDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.separatorColor = [UIColor clearColor];
    self.manager = self.objectConfiguration.kHCardTlakDatamanager;
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    self.dataSource.tableView = self.tableView;
    self.manager.delegate = self;
//    [self.manager fetchChatsAtCard:self.dataSource.card.articleID];
    [self.manager fetchChatsFromPrivateRealmAtCard:self.dataSource.card.articleID];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerImageUpdateNotificationHandler {
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(receivedImage:)
     name:ImageStoreDidUpdateContentNotification
     object:nil];
}

- (void)receivedImage:(NSNotification *)notification {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) didReceiveChats:(NSArray *)chats {
    self.dataSource.chatList = [NSArray arrayWithArray:chats];
    [self.tableView reloadData];
    

}

- (void)fetchingCardsFailedWithError:(NSError *)error {
    
}

@end
