//
//  TDLTableViewController.m
//  To Do List
//
//  Created by JOHN YAM on 4/8/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"

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
                       @{@"name" : @"buy groceries", @"priority" : @0},
                       @{@"name" : @"buy groceries", @"priority" : @1},
                       @{@"name" : @"buy groceries", @"priority" : @2},
                       @{@"name" : @"buy groceries", @"priority" : @3}
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

- (void) addNewItem:(id)sender
{
    UIButton * button = (UIButton *)sender;
    NSString * name = itemField.text;
    itemField.text = @"";
    
    if(![name isEqualToString:@""])
    {
        [listItems insertObject:@{@"name" : name, @"priority" : @(button.tag)} atIndex:0];
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
    
    NSDictionary * listItem = listItems[indexPath.row];
    //cell.backgroundColor = priorityColors[[listItem[@"priority"]intValue]];
    
    cell.bgView.backgroundColor = priorityColors[[listItem[@"priority"]intValue]];

    cell.nameLabel.text = listItem[@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    
    return cell;
}

- (void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    NSLog(@"%@",gesture);
    
    switch (gesture.direction) {
        case 1:
            NSLog(@"swiping right");
            break;
        case 2:
            NSLog(@"swiping left");
            break;
        default:
            break;
    }
}

- (BOOL)prefersStatusBarHidden {return YES;}


@end
