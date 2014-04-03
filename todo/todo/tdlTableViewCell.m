//
//  tdlTableViewCell.m
//  todo
//
//  Created by JOHN YAM on 4/3/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlTableViewCell.h"

@implementation tdlTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}



- (void) setProfileInfo:(NSDictionary *)profileInfo
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame: CGRectMake(20, 20, 60, 60)];
    
    imageView.image = profileInfo[@"image"];
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview: imageView];
    
    UILabel * contactNames = [[UILabel alloc] initWithFrame: CGRectMake(100, 10, 200, 30)];
    contactNames.text = profileInfo[@"name"];
    [self.contentView addSubview: contactNames];
    
    
    _profileInfo = profileInfo;
    
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
