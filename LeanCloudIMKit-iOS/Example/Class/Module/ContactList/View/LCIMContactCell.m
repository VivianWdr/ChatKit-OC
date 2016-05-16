//
//  LCIMContactCell.m
//  LeanCloudIMKit-iOS
//
//  Created by 陈宜龙 on 16/3/9.
//  Copyright © 2016年 ElonChan. All rights reserved.
//

#import "LCIMContactCell.h"
#import "LCIMConstants.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LCIMKit.h"
#import "UIImageView+CornerRadius.h"

@interface LCIMContactCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation LCIMContactCell

- (void)awakeFromNib {
    [self setup];
}

- (void)setup {
    LCIMAvatarImageViewCornerRadiusBlock avatarImageViewCornerRadiusBlock = [LCIMKit sharedInstance].avatarImageViewCornerRadiusBlock;
    if (avatarImageViewCornerRadiusBlock) {
        CGFloat avatarImageViewCornerRadius = avatarImageViewCornerRadiusBlock(self.avatorImageView.frame.size);
        [self.avatorImageView zy_cornerRadiusAdvance:avatarImageViewCornerRadius rectCornerType:UIRectCornerAllCorners];
    }
}

- (void)configureWithAvatorURL:(NSURL *)avatorURL title:(NSString *)title subtitle:(NSString *)subtitle {
    NSString *imageName = @"Placeholder_Avator";
    NSString *imageNameWithBundlePath = [NSString stringWithFormat:@"Placeholder.bundle/%@", imageName];
    UIImage *avatorImage = [UIImage imageNamed:imageNameWithBundlePath];
    [self.avatorImageView sd_setImageWithURL:avatorURL placeholderImage:avatorImage];
    self.titleLabel.text = title;
    self.subtitleLabel.text = subtitle;
    if (subtitle.length == 0) {
        [self.subtitleLabel removeFromSuperview];
    }
}

@end