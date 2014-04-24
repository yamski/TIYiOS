//
//  TLATableViewCell.m
//  Tweet_Like
//
//  Created by JOHN YAM on 4/23/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell

{
    UILabel * likesLabel;
    UILabel * textLabel;

}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
//        UIButton * heartButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
//        UIImage * heartImage = [UIImage imageNamed:@"heart"];
//        [heartButton setImage:heartImage forState:UIControlStateNormal];
        
        UIImageView * heart = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 20, 20)];
        
        heart.image = [UIImage imageNamed:@"heart"];
        
        [self.contentView addSubview:heart];
        
        
        likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 50, 20)];
        //likesLabel.text = @"55";
        likesLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:likesLabel];
    
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 200, 80)];
        //textLabel.text = @"Hello my name is john. heres some text ";
        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        textLabel.numberOfLines = 0;
        textLabel.font = [UIFont systemFontOfSize:13];
        
        
        [self.contentView addSubview:textLabel];
        
      
        
    }
    return self;
}


-(void)setTweetList:(NSDictionary *)tweetList
{
    _tweetList = tweetList;
    
    likesLabel.text = [tweetList[@"likes"] stringValue];
    textLabel.text = tweetList[@"tweet"];
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
