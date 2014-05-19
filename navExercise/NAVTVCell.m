//
//  NAVTVCell.m
//  navExercise
//
//  Created by JOHN YAM on 5/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "NAVTVCell.h"
#import "NAVsingletonData.h"

@implementation NAVTVCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 20)];
//        
//        [self.contentView addSubview:textLabel];
        
        self.backgroundColor = [UIColor yellowColor];
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

//-(void)setIndex:(NSInteger)index
//{
//    _index = index;
//    
//    NSArray * colors = [NAVsingletonData mainData].colors;
//    
//    NSLog(@"%@",colors);
//    
////   [textLabel setText:colors[index]];
//
//    self.textLabel.text = colors[index];
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
