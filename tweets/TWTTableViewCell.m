//
//  TWTTableViewCell.m
//  tweets
//
//  Created by JOHN YAM on 4/13/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TWTTableViewCell.h"

@implementation TWTTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width - 40, 40)];
        self.backgroundColor = [UIColor blueColor];
        
        [self.contentView addSubview:self.bgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 4, 200, 30)];
        self.nameLabel.textColor = [UIColor grayColor];
        self.nameLabel.font = [UIFont fontWithName:@"Avenir-Book" size:18];
        [self.bgView addSubview:self.nameLabel];

    }
    return self;
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
