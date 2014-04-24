//
//  TLATableVC.m
//  Tweet_Like
//
//  Created by JOHN YAM on 4/23/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TLATableVC.h"
#import "TLATableViewCell.h"

@interface TLATableVC ()


@end


@implementation TLATableVC


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        //self.tableView.contentInset = UIEdgeInsetsMake(30,0, 0, 0);
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.rowHeight = 80;
        
//        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
//        header.backgroundColor = [UIColor colorWithRed:0.267f green:0.376f blue:0.486f alpha:1.0f];
//        self.tableView.tableHeaderView = header;
//        [self.view addSubview:header];
        
        self.tweetItems = [@[
//                       @{
//                           @"likes": @21,
//                         @"tweet": @"Once upon a time there was a tweet."
//                         },
//                       
//                       @{
//                         @"likes": @23,
//                         @"tweet": @"theres a guy named John Yam in the Iron Yard iOS class"
//                         },
//                       
//                       @{
//                         @"likes": @44,
//                         @"tweet": @"this is the tweet3"
//                         }
                       
                       ]mutableCopy];
        
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
    return [self.tweetItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    if (cell == nil) cell = [[TLATableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                    reuseIdentifier: @"cell"];
    
    //NSDictionary * listItem = listItems[indexPath.row];
    
    
    cell.tweetList = self.tweetItems[indexPath.row];

    
    //NSLog(@"%@",cell.tweetList);
    
    return cell;
}

-(void)loadNewTweet:(NSString *)tweet
{
    NSDictionary * updatedTweet = @{
                                   @"likes": @0,
                                   @"tweet": tweet
                                   };
    
    [self.tweetItems addObject:updatedTweet];
   [self.tableView reloadData];

    
//    for (NSDictionary* tweetInfo in listItems)
//    {
//        NSLog(@"%@", tweetInfo);
//    }
}

//the 2nd way to load tweet. similar to my method above that i made
-(void)createNewTweet:(NSString *)tweet
{
    if ([tweet isEqualToString:@""]) return;
    
    [self.tweetItems insertObject:@{
                                    @"likes": @0,
                                    @"tweet": tweet} atIndex:0];
     [self.tableView reloadData];
    
}

-(BOOL)isTweetItemsEmpty{
    
    //if it equals to 0, it is empty
    return ([self.tweetItems count] == 0);
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
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
