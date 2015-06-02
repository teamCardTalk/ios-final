//
//  KHChatViewCell.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 1..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHChatModel.h"
#import "KHUserModel.h"

@interface KHChatViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeightConstraint;

@property (strong, nonatomic) KHChatModel *chat;

- (void)configurationChatCell;
- (void)iconImageViewConfiguration:(UIImage *)image;
@end
