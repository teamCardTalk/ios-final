//
//  KHMainImageViewCell.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 30..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHMainImageViewCell.h"



@implementation KHMainImageViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellConfiguration {
    [self titleConfiguration];
    [self dateConfiguration];
    [self contentConfiguration];
}

- (void)titleConfiguration {
    self.titleLabel.text = self.card.title;
    [self.titleLabel sizeToFit];
    [self.titleHeightConstraint setConstant:self.titleLabel.frame.size.height];
}

- (void)dateConfiguration {
    self.dateLabel.text = self.card.createtime;
    [self.dateLabel sizeToFit];
    [self.dateHeightConstraint setConstant:self.dateLabel.frame.size.height];
}

- (void)contentConfiguration {
    self.contentLabel.text = self.card.content;
    [self.contentLabel sizeToFit];
    [self.contentHeightConstraint setConstant:self.contentLabel.frame.size.height];
}

- (void)mainImageViewConfiguration:(UIImage *)image {
    [self.mainImageView setImage:image];
    CGRect originFrame = self.mainImageView.frame;
    CGFloat originWidth = originFrame.size.width;
    CGFloat desiredHeight = (image.size.height /image.size.width) * originWidth;
    
    [self.imageViewHeightConstraint setConstant:desiredHeight];
}

- (void)iconImageViewConfiguration:(UIImage *)image {
    self.iconImageView.image = image;
}

@end
