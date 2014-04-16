//
//  TWTTableVC.m
//  tweets
//
//  Created by JOHN YAM on 4/13/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TWTTableVC.h"
#import "TWTTableViewCell.h"



@interface TWTTableVC ()

@end

@implementation TWTTableVC

{
    NSMutableArray *listItems;
    UITextField *nameField;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        
        
        listItems = [@[
                       @{@"created_at" : @"Sat Apr 12",
                         @"user" : @{@"name":@"Jo Albright",
                                     @"screen_name":@"Joalbright",
                                    @"description": @"Co-Founder & iOS Developer"},
                         @"tweet" : @"Hello World"},
                     
                    ] mutableCopy];
        
        
        self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
        self.tableView.rowHeight = 75;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
        header.backgroundColor = LIGHTBLUE_COLOR;
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame: CGRectMake(20, 25, 160, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.40];
        [header addSubview:nameField];
        
        //the next two lines moves the blinking cursor to the right from the very left edge
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        
        nameField.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:18];
        nameField.tintColor = [UIColor whiteColor];
        
        nameField.delegate = self;
        
        UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 25, 30, 30)];
        submitButton.layer.cornerRadius = 14;
        submitButton.backgroundColor = [UIColor whiteColor];
        [submitButton setTitle:@"" forState:UIControlStateNormal];
        [header addSubview:submitButton];
        
         UIButton *roundButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        roundButton.frame = CGRectMake(280, 25, 30, 30);
        roundButton.backgroundColor = [UIColor redColor];
        [header addSubview:roundButton];

        
//        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//        footer.backgroundColor = [UIColor lightGrayColor];
//        self.tableView.tableFooterView = footer;
        
        
        
        
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[TWTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier: @"cell"];
    
    // Configure the cell...
    
    
    NSDictionary * listItem = listItems[indexPath.row];
    cell.nameLabel.text = listItem[@"created_at"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
