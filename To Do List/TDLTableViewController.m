//
//  TDLTableViewController.m
//  To Do List
//
//  Created by JOHN YAM on 4/8/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TDLTableViewController.h"

#import "MOVE.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController

{
    NSMutableArray * listItems;
    UITextField * itemField;
    UIButton * lowButton;
    UIButton * mediumButton;
    UIButton * highButton;
    NSArray * priorityColors;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        priorityColors = @[BLUE_COLOR, GREEN_COLOR, YELLOW_COLOR, RED_COLOR];
        
        listItems = [@[
                       @{@"name" : @"buy groceries", @"priority" : @0, @"constant" : @0},
                       @{@"name" : @"buy groceries", @"priority" : @1, @"constant" : @1},
                       @{@"name" : @"buy groceries", @"priority" : @2, @"constant" : @2},
                       @{@"name" : @"buy groceries", @"priority" : @3, @"constant" : @3}
                       ] mutableCopy];
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.tableView.rowHeight = 50;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        header.backgroundColor = [UIColor whiteColor];
        [self.tableView setTableHeaderView:header];
        
        itemField = [[UITextField alloc] initWithFrame:CGRectMake(10, 15, 170, 30)];
        itemField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        itemField.layer.cornerRadius = 6;
        itemField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        itemField.leftViewMode = UITextFieldViewModeAlways;
        itemField.placeholder = @"Enter Item";
        itemField.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:18];
        itemField.tintColor = [UIColor whiteColor];
        
        //TVC says that it is the delegate of the UITextField
        itemField.delegate = self;

        [header addSubview:itemField];
        
    
        
        lowButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 15, 30, 30)];
        lowButton.backgroundColor = GREEN_COLOR;
        lowButton.layer.cornerRadius = 15;
        lowButton.tag = 1;
        
        [lowButton addTarget:self action:@selector(addNewItem:)
               forControlEvents:UIControlEventTouchUpInside];

        [header addSubview:lowButton];
        
        mediumButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 15, 30, 30)];
        mediumButton.backgroundColor = YELLOW_COLOR;
        mediumButton.layer.cornerRadius = 15;
        mediumButton.tag = 2;
        
        [mediumButton addTarget:self action:@selector(addNewItem:)
            forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:mediumButton];
        
        highButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 15, 30, 30)];
        highButton.backgroundColor = RED_COLOR;
        highButton.layer.cornerRadius = 15;
        highButton.tag = 3;
        
        [highButton addTarget:self action:@selector(addNewItem:)
            forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:highButton];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    itemField.placeholder = @" ";
    itemField.textColor = [UIColor grayColor];
    itemField.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    itemField.placeholder = @"Enter Item";
    itemField.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
}

-(void)deleteItem:(TDLTableViewCell *)cell
{
    NSLog(@"Delete");
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    [listItems removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    NSDictionary *listItem = listItems[indexPath.row];
    
    NSDictionary * updateListItem = @{
                                      @"name": listItem[@"name"],
                                      @"priority" : @(priority),
                                      @"constant" : @(priority)
                                      };
    
    //remove old dictionary for cell
    [listItems removeObjectAtIndex:indexPath.row];
    
    //add new dictionary for cell
    [listItems insertObject:updateListItem atIndex:indexPath.row];
    
    cell.bgView.backgroundColor = priorityColors[priority];
    
    [MOVE animateView:cell.bgView properties:@{@"x" : @10, @"duration" : @0.5}];
    [cell hideCircleButton];
    cell.swiped = NO;
    
    NSLog(@"Priority : %d", priority);
    
}

//this method is available bc it's a delegate of UITextField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Return");
    [textField resignFirstResponder];
    return YES;
}

- (void) addNewItem:(id)sender
{
    UIButton * button = (UIButton *)sender;
    NSString * name = itemField.text;
    itemField.text = @"";
    
    if(![name isEqualToString:@""])
    {
        [listItems insertObject:@{@"name" : name, @"priority" : @(button.tag), @"constant": @(button.tag)}  atIndex:0];
    }
    [itemField resignFirstResponder];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [listItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
        reuseIdentifier: @"cell"];
    
    [cell resetLayout];
    
    //setting the View Controller to be the delagate of the cell. "Cell, you can tell me what to do!"
    cell.delegate = self;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary * listItem = listItems[indexPath.row];
    //cell.backgroundColor = priorityColors[[listItem[@"priority"]intValue]];
    
    cell.bgView.backgroundColor = priorityColors[[listItem[@"priority"]intValue]];
    
    if([listItem[@"priority"] intValue] == 0)
    {
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
    } else {
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
    }

    cell.nameLabel.text = listItem[@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //get cell from tableview at row
    TDLTableViewCell *cell = (TDLTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    //disables strikethrough when the cell is swiped left
    if(cell.swiped){ return;}
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    NSDictionary * updateListItem = listItem;
    
    //!=0 below in if statement is redundant. Anything other than 0 (including neg numbers) is true
    if ([listItem[@"priority"] intValue] !=0)
        {
            
        cell.bgView.backgroundColor = priorityColors[0];
        
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
        updateListItem = @{
                          @"name" : listItem[@"name"],
                          @"priority" : @0,
                          @"constant" : listItem[@"constant"]
                          };
        }
    else
        {
            cell.bgView.backgroundColor = priorityColors[[listItem[@"constant"] intValue]];
            
            cell.strikeThrough.alpha = 0;
            cell.circleButton.alpha = 1;
            //create new dictionary with the done property
            updateListItem = @{
                               @"name" : listItem[@"name"],
                               @"priority" : listItem[@"constant"],
                               @"constant" : listItem[@"constant"]
                               };
        
        }
    //remove old dictionary for cell
    [listItems removeObjectAtIndex:indexPath.row];
    
    //add new dictionary for cell
    [listItems insertObject:updateListItem atIndex:indexPath.row];
}

- (void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    TDLTableViewCell * cell = (TDLTableViewCell *)gesture.view;
    NSInteger index = [self.tableView indexPathForCell:cell].row;
    NSDictionary * listItem = listItems[index];
    
    //    NSLog(@"%@",gesture);

//    gesture.direction == left : 2
//    gesture.direction == right : 1
//    gesture.direction == left && priority == 0 : 12
//    gesture.direction == right && priority == 0 : 11
    
    int completed;
    
    completed = ([listItem[@"priority"] intValue] == 0) ? 10 : 0;
    
    switch (gesture.direction + completed) {
        case 1: //right
            NSLog(@"swiping right");
            [MOVE animateView:cell.bgView properties:@{@"x": @10, @"duration": @0.3}];
            [cell hideCircleButton];
            cell.swiped = NO;
            break;
            
        case 2: //left
            NSLog(@"swiping left");
            [MOVE animateView:cell.bgView properties:@{@"x": @-130, @"duration": @0.3}];
            [cell showCircleButton];
            cell.swiped = YES;
            break;
            
        case 11: //right
            [MOVE animateView:cell.bgView properties:@{@"x": @10, @"duration": @0.3}];
            [cell hideDeleteButton];
            cell.swiped = NO;
            break;
            
        case 12: //left
            [MOVE animateView:cell.bgView properties:@{@"x": @-30, @"duration": @0.3}];
            [cell showDeleteButton];
            cell.swiped = YES;
            break;
            
        
            
        default:
            break;
    }
}

- (BOOL)prefersStatusBarHidden {return YES;}


@end
