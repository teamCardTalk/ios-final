//
//  KHChatViewCell.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 1..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHChatViewCell.h"

@implementation KHChatViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)iconImageViewConfiguration:(UIImage *)image {
    self.iconImageView.image = image;
}

- (void)configurationChatCell {
    [self configurationNickname];
    [self configurationContent];
    [self configurationDate];
}

- (void)configurationNickname {
    self.nicknameLabel.text = self.chat.user.nickname;
}

- (void)configurationContent {
    self.contentLabel.text = self.chat.content;
    [self.contentLabel sizeToFit];
    [self.contentHeightConstraint setConstant:self.contentLabel.frame.size.height];
}

- (void)configurationDate {
//    self.dateLabel.text = self.chat.date;
}

@end
