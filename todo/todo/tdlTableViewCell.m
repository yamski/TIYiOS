//
//  tdlTableViewCell.m
//  todo
//
//  Created by JOHN YAM on 4/3/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlTableViewCell.h"

@implementation tdlTableViewCell
@synthesize profileInfo = _profileInfo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (NSDictionary *)profileInfo
{
    if (_profileInfo == nil) {
        _profileInfo = @{@"name": @"Default Name", @"image": [UIImage imageNamed:@"default"]};
    }
    
    return _profileInfo;
}

- (void) setProfileInfo:(NSDictionary *)profileInfo
{
    if (profileInfo != nil) _profileInfo = profileInfo;
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
