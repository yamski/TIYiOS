//
//  SLFTVController.m
//  Selfy
//
//  Created by JOHN YAM on 4/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SLFTVController.h"
#import "SLFTableViewCell.h"
#import <Parse/Parse.h>

@interface SLFTVController ()
{
   NSMutableArray * listItems;
}

@end

@implementation SLFTVController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        listItems = [@[
                      @{@"image":@"http://distilleryimage8.ak.instagram.com/80f4afb00acc11e39d4222000aaa07fd_7.jpg",
                      @"caption": @"Hello world!",
                      @"user_id": @"John Yam",
                      @"avatar": @"http://scontent-b.igcdn.com/hphotos-ash/t51.2885-15/1889151_214157545439581_338089635_n.jpg"},
                      
                      @{@"image":@"http://distilleryimage8.ak.instagram.com/80f4afb00acc11e39d4222000aaa07fd_7.jpg",
                        @"caption": @"A new caption",
                        @"user_id": @"Another Guy",
                        @"avatar": @"http://scontent-b.igcdn.com/hphotos-ash/t51.2885-15/1889151_214157545439581_338089635_n.jpg"}
                      ]
                      mutableCopy];
        
        PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
        testObject[@"foo"] = @"bar";
        [testObject saveInBackground];
        
        
        PFUser * user = [PFUser currentUser];
        
        user.username = @"johnyam";
        user.password = @"password";
        [user saveInBackground];
        
        
        self.tableView.contentInset = UIEdgeInsetsMake(30,0, 0, 0);
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        self.tableView.rowHeight = self.tableView.frame.size.width + 100;

        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        header.backgroundColor = [UIColor colorWithRed:0.267f green:0.376f blue:0.486f alpha:1.0f];
        self.tableView.tableHeaderView = header;
        [self.view addSubview:header];
        
        
        UIButton * settings = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, 15, 30, 30)];
        settings.layer.cornerRadius = 15;
        settings.backgroundColor = [UIColor colorWithRed:0.392f green:0.561f blue:0.722f alpha:1.0f];
        //UIImage *settingsImage = [UIImage imageNamed:@"settings_filled-512.png"];
        //[settings setImage:settingsImage forState:UIControlStateNormal];
        
        [header addSubview:settings];
        

        
        UIButton * addNew = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 45, 15, 30, 30)];
        addNew.layer.cornerRadius = 15;
        addNew.backgroundColor = [UIColor whiteColor];
        UIImage *plusImage = [UIImage imageNamed:@"plus-512.png"];
        [addNew setImage:plusImage forState:UIControlStateNormal];
        
        [header addSubview:addNew];
        
        
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(20 , 10, 80, 40)];
        title.backgroundColor = [UIColor clearColor];
        title.text = @"Selfy";
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont fontWithName:@"Avenir-Light" size:30];
        title.textAlignment = NSTextAlignmentCenter;
        [header addSubview:title];
        
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   SLFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    
    if (cell == nil) cell = [[SLFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                    reuseIdentifier: @"cell"];
    
    //NSDictionary *listItem = listItems[indexPath.row];
    
    
//    cell.textLabel.text = listItem[@"user_id"];
//    cell.detailTextLabel.text = listItem[@"caption"];
//    cell.imageView.image = listItem[@"image"];
    
//    UIImage *theImage = [UIImage imageNamed:@"johnyam"];
//    cell.imageView.image = theImage;

   //cell.profileInfo = [self getListItem:indexPath.row];
    
    cell.profileInfo = [listItems objectAtIndex:indexPath.row];
    
    NSLog(@"%@",cell.profileInfo);
    
    NSLog(@"this is indexPath.row: %ld", (long)indexPath.row);
    
    return cell;
}

//this reverses the array
- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
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
