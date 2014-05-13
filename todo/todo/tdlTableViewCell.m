//
//  tdlTableViewCell.m
//  todo
//
//  Created by JOHN YAM on 4/3/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlTableViewCell.h"
#import "tdlSingletonData.h"

@implementation tdlTableViewCell

{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileURL;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        profileImage = [[UIImageView alloc] initWithFrame: CGRectMake(20, 20, 60, 60)];
        profileImage.layer.cornerRadius = 30;
        profileImage.layer.masksToBounds = YES;
        [self.contentView addSubview: profileImage];
        
        profileName = [[UILabel alloc] initWithFrame: CGRectMake(100, 20, 200, 30)];
        profileName.textColor = [UIColor darkGrayColor];
        profileName.font = [UIFont systemFontOfSize: 20];
        [self.contentView addSubview: profileName];
        
        profileURL = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 30)];
        profileURL.textColor = [UIColor lightGrayColor];
        profileURL.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview: profileURL];
        
    }
    return self;
}

- (void) setIndex:(NSInteger)index
{
    _index = index;
    
    NSDictionary * profileInfo = [[tdlSingletonData sharedCollection] allListItems][index];
    
    NSURL *imageUrl = [NSURL URLWithString:profileInfo[@"image"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    profileImage.image = image;
    profileName.text = profileInfo[@"name"];
    profileURL.text = profileInfo [@"github"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
