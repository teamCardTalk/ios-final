//
//  KHMainTableViewDataSource.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHMainTableViewDataSource.h"

@implementation KHMainTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.cards count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KHMainImageViewCell *cell = nil;
    
    KHCardModel *card = [self.cards objectAtIndex:indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"MainImageViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self configureCell:cell fromCard:card];
    NSLog(@"cellForRowAtIndexPath Called");
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    static KHMainImageViewCell *sizingCell = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        sizingCell = [tableView dequeueReusableCellWithIdentifier:@"MainImageViewCell"];
    });
    
    KHCardModel *card = [self.cards objectAtIndex:indexPath.row];
    [self configureCell:sizingCell fromCard:card];
    
    [sizingCell.contentView setNeedsLayout];
    [sizingCell.contentView layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height + 1.0f;
}

- (void)configureCell:(KHMainImageViewCell *)cell fromCard:(KHCardModel *)card {
    cell.card = card;
    [cell cellConfiguration];

    NSString *iconName = [card.author getIconName];
    NSData *iconData = [self.imageStore dataForURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://125.209.195.202:3000/image/icon=%@", iconName]]];
    
    if (iconData) {
        UIImage *image = [[UIImage alloc] initWithData:iconData];
        [cell iconImageViewConfiguration:image];
    }
    
    for (KHImageFileModel *imageFileModel in card.imageList) {
        NSString *fileName = [imageFileModel getFileName];
        NSString *urlString = [NSString stringWithFormat:@"http://125.209.195.202:3000/image/photo=%@", fileName];
        NSData *imageData = [self.imageStore dataForURL:[NSURL URLWithString:urlString]];
        if (imageData) {
            [cell mainImageViewConfiguration:[UIImage imageWithData:imageData]];
        }
    }
}

- (void)registerForUpdatesToImageStore:(KHImageStore*) imageStore {
    [self.notificationCenter addObserver:self selector:@selector(imageStoreDidUpdateContent:) name:ImageStoreDidUpdateContentNotification object:imageStore];
}

- (void)removeObservationOfUpdatesToImageStore:(KHImageStore *)imageStore {
    [self.notificationCenter removeObserver:self name:ImageStoreDidUpdateContentNotification object:imageStore];
}

- (void)imageStoreDidUpdateContent:(NSNotification *)notification {
    [self.tableView reloadData];
}



@end
