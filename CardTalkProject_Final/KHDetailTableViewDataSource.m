//
//  KHDetailTableViewDataSource.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHDetailTableViewDataSource.h"

@implementation KHDetailTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self isContentSection:section]) {
        return 1;
    } else {
        return self.chatList.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isContentSection:indexPath.section]) {
        KHDetailViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DetailImageViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self configureCell:cell fromCard:self.card];
        return cell;
    } else {
        KHChatViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ChatCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.chat = self.chatList[indexPath.row];
        [self configureCell:cell fromChat:cell.chat];
        return cell;
    }
}


- (void)configureCell:(KHChatViewCell *)cell fromChat:(KHChatModel *)chat {
    [cell configurationChatCell];
    NSString *iconName = [chat.user getIconName];
    NSData *iconData = [self.imageStore dataForURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://125.209.195.202:3000/image/icon=%@", iconName]]];
    if (iconData) {
        UIImage *image = [[UIImage alloc] initWithData:iconData];
        [cell iconImageViewConfiguration:image];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isContentSection:indexPath.section]) {
        static KHDetailViewCell *sizingCell = nil;
        static dispatch_once_t oncetoken;
        
        dispatch_once(&oncetoken, ^{
            sizingCell = [self.tableView dequeueReusableCellWithIdentifier:@"DetailImageViewCell"];
        });
        
        [self configureCell:sizingCell fromCard:self.card];
        
        [sizingCell.contentView setNeedsLayout];
        [sizingCell.contentView layoutIfNeeded];
        
        CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        return size.height + 1.0f;
    } else {
        static KHChatViewCell *sizingCell = nil;
        static dispatch_once_t oncetoken;
        
        dispatch_once(&oncetoken, ^{
            sizingCell = [self.tableView dequeueReusableCellWithIdentifier:@"ChatCell"];
        });
        
        sizingCell.chat = self.chatList[indexPath.row];
        [self configureCell:sizingCell fromChat:sizingCell.chat];
        
        [sizingCell.contentView setNeedsLayout];
        [sizingCell.contentView layoutIfNeeded];
        
        CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        return size.height + 1.0f;
    }
}

- (BOOL)isContentSection:(NSInteger)section {
    if (section == 0)
        return YES;
    else
        return NO;
}

@end
