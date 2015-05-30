//
//  KHMainTableViewDataSource.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHMainTableViewDataSource.h"

@implementation KHMainTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KHMainImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainImageViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



@end
