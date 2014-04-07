//
//  TVPTableViewCell.m
//  tableViewPractice
//
//  Created by JOHN YAM on 4/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TVPTableViewCell.h"

@implementation TVPTableViewCell

{
    UIImageView *profileImage;
    UILabel *profileName;
    UILabel *profileURL;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        profileImage = [[UIImageView alloc] initWithFrame: CGRectMake(20, 20, 60, 60)];
        profileImage.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:profileImage];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 300, 30)];
        profileName.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:profileName];
        
        profileURL = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 30)];
        profileURL.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:profileURL];
    }
    
    return self;
}

-(void)setProfileInfo:(NSDictionary *)profileInfo
{
    profileImage.image = [profileInfo objectForKey:@"image"];
    profileName.text = [profileInfo objectForKey:@"name"];
    profileURL.text = [profileInfo objectForKey:@"github"];
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
