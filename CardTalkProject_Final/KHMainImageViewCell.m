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

- (void)realmCellConfiguration {
    [self cellConfiguration];
    [self mainImageViewConfigurationForRealmCell];
    [self iconImageViewConfigurationForRealmCell];
}

- (void)mainImageViewConfigurationForRealmCell {
    UIImage *image = [self.realmCard getImage];
    [self.mainImageView setImage:image];
    CGRect originFrame = self.mainImageView.frame;
    CGFloat originWidth = originFrame.size.width;
    CGFloat desiredHeight = (image.size.height /image.size.width) * originWidth;
    
    [self.imageViewHeightConstraint setConstant:desiredHeight];
}

- (void)iconImageViewConfigurationForRealmCell {
    int randomNum = 1 + arc4random() % 4;
    NSString *iconName = [NSString stringWithFormat:@"icon%d", randomNum];
    UIImage *image = [UIImage imageNamed:iconName];
    self.iconImageView.image = image;
}

- (void)cellConfiguration {
    [self titleConfiguration];
    [self dateConfiguration];
    [self contentConfiguration];
}

- (void)titleConfiguration {
    self.titleLabel.text = self.realmCard.title;
    [self.titleLabel sizeToFit];
    
    CGSize size = self.titleLabel.frame.size;

    [self.titleHeightConstraint setConstant:size.height];
}

- (void)dateConfiguration {
    self.dateLabel.text = self.realmCard.createtime;
    [self.dateLabel sizeToFit];
    
    [self.dateHeightConstraint setConstant:self.dateLabel.frame.size.height];
}

- (void)contentConfiguration {
    self.contentLabel.text = self.realmCard.content;
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
