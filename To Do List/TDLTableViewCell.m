//
//  TDLTableViewCell.m
//  To Do List
//
//  Created by JOHN YAM on 4/8/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "MOVE.h"

@implementation TDLTableViewCell

{
    UIButton * lowButton;
    UIButton * mediumButton;
    UIButton * highButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10,0, self.frame.size.width - 20, 40)];
        self.bgView.layer.cornerRadius = 6;
        [self.contentView addSubview:self.bgView];
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 4, 200, 30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
        [self.bgView addSubview:self.nameLabel];
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 20, self.frame.size.width - 30, 1)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
        self.circleButton.backgroundColor = [UIColor whiteColor];
        self.circleButton.layer.cornerRadius = 10;
        [self.bgView addSubview:self.circleButton];
        
    }
    return self;
}

-(void)resetLayout
{
    if (self.swiped) {
        [self createButtons];
        self.swiped = YES;
    } else {
        self.bgView.frame = CGRectMake(10,0, self.frame.size.width - 20, 40);
        [lowButton removeFromSuperview];
        [mediumButton removeFromSuperview];
        [highButton removeFromSuperview];
        self.swiped = NO;
    }
}

-(void)createButtons
{
    lowButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 5, 30, 30)];
    lowButton.backgroundColor = GREEN_COLOR;
    lowButton.layer.cornerRadius = 15;
    lowButton.tag = 1;
    lowButton.alpha = 0;
    
    [lowButton addTarget:self action:@selector(pressPriorityButton:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:lowButton];
    
    mediumButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 5, 30, 30)];
    mediumButton.backgroundColor = YELLOW_COLOR;
    mediumButton.layer.cornerRadius = 15;
    mediumButton.tag = 2;
    mediumButton.alpha = 0;
    
    [mediumButton addTarget:self action:@selector(pressPriorityButton:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:mediumButton];
    
    highButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 5, 30, 30)];
    highButton.backgroundColor = RED_COLOR;
    highButton.layer.cornerRadius = 15;
    highButton.tag = 3;
    highButton.alpha = 0;
 
    [highButton addTarget:self action:@selector(pressPriorityButton:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:highButton];
}


-(void)pressPriorityButton:(id)sender
{
    UIButton * button = (UIButton *)sender;
    [self.delegate setItemPriority:button.tag withItem:self];
}


-(void)showCircleButton
{
    [self createButtons];
    
    [MOVE animateView:lowButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.3}];
    [MOVE animateView:mediumButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.2}];
    [MOVE animateView:highButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.1}];
}


-(void)hideCircleButton
{
    [MOVE animateView:lowButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.1, @"remove" : @YES}];
    [MOVE animateView:mediumButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.2, @"remove" : @YES}];
    [MOVE animateView:highButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.3, @"remove" : @YES}];
    
}


-(void)showDeleteButton
{
    highButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 5, 30, 30)];
    highButton.backgroundColor = RED_COLOR;
    highButton.layer.cornerRadius = 15;
    highButton.alpha = 0;
    
    [highButton setTitle:@"X" forState:UIControlStateNormal];
    highButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    
    [self.contentView addSubview:highButton];
    
    [highButton addTarget:self action:@selector(pressDeleteButton)
         forControlEvents:UIControlEventTouchUpInside];
    [MOVE animateView:highButton properties:@{@"alpha": @1, @"duration": @0.2, @"delay": @0.1}];
}

-(void)pressDeleteButton
{
    //self.delegate is table view controller
    //self is the cell
    [self.delegate deleteItem:self];
}

-(void)hideDeleteButton
{
    
    [MOVE animateView:highButton properties:@{@"alpha": @0, @"duration": @0.2, @"delay": @0.0, @"remove" : @YES}];
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
