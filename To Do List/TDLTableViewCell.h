//
//  TDLTableViewCell.h
//  To Do List
//
//  Created by JOHN YAM on 4/8/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDLTableViewCellDelegate;

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic, assign) id<TDLTableViewCellDelegate> delegate;


@property (nonatomic) UILabel * nameLabel;
@property (nonatomic) UIView * bgView;
@property (nonatomic) UIView *strikeThrough;
@property (nonatomic) UIButton * circleButton;

@property (nonatomic) BOOL swiped;

-(void)resetLayout;

-(void)showCircleButton;
-(void)hideCircleButton;

-(void)showDeleteButton;
-(void)hideDeleteButton;

@end

@protocol TDLTableViewCellDelegate <NSObject>

-(void)deleteItem:(TDLTableViewCell *)cell;
-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell;

@optional
-(void)optionalMethod;

@end
