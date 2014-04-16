//
//  TWTTableViewCell.h
//  tweets
//
//  Created by JOHN YAM on 4/13/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWTTableViewCell : UITableViewCell

@property (nonatomic) UILabel * nameLabel;
@property (nonatomic) NSDictionary * profileInfo;
@property (nonatomic) UIView * bgView;

@end
