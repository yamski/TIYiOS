//
//  SLFTableViewCell.m
//  Selfy
//
//  Created by JOHN YAM on 4/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SLFTableViewCell.h"

@implementation SLFTableViewCell
{
    UIImageView * profileImage;
    UIImageView * avatarView;
    UILabel * profileName;
    UILabel * captionLabel;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        profileImage = [[UIImageView alloc] initWithFrame: CGRectMake(10, 10, 300, 300)];
        profileImage.layer.cornerRadius = 5;
        profileImage.layer.masksToBounds = YES;
        [self.contentView addSubview: profileImage];

        avatarView = [[UIImageView alloc] initWithFrame: CGRectMake(10, 325, 40, 40)];
        avatarView.layer.cornerRadius = 20;
        avatarView.layer.masksToBounds = YES;
        [self.contentView addSubview: avatarView];

        
        profileName = [[UILabel alloc] initWithFrame: CGRectMake(60, 320, 200, 30)];
        profileName.textColor = [UIColor darkGrayColor];
        profileName.font = [UIFont systemFontOfSize: 20];
        [self.contentView addSubview: profileName];
        
        captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 340, 200, 30)];
        captionLabel.textColor = [UIColor lightGrayColor];
        captionLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview: captionLabel];
        

    }
    return self;
}

- (void) setProfileInfo:(NSDictionary *)profileInfo
{
    _profileInfo = profileInfo;
    
    NSURL *imageUrl = [NSURL URLWithString:profileInfo[@"image"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [UIImage imageWithData:imageData];
    
    profileImage.image = image;
    
    
    NSURL *avatarUrl = [NSURL URLWithString:profileInfo[@"avatar"]];
    NSData *avatarData = [NSData dataWithContentsOfURL:avatarUrl];
    UIImage *avatar = [UIImage imageWithData:avatarData];
    
    avatarView.image = avatar;
    
    profileName.text = profileInfo[@"user_id"];
    captionLabel.text = profileInfo [@"caption"];
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
