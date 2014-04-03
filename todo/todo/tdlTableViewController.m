//
//  tdlTableViewController.m
//  todo
//
//  Created by JOHN YAM on 4/2/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlTableViewController.h"




@implementation tdlTableViewController

{
    NSArray *listItems;
    NSArray *listImages;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
      
        
        
        listItems = @[
                      @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"alihoushmand"]},
                      @{@"name" : @"Ashby Thornwell", @"image" : [UIImage imageNamed:@"ashbythornwell"]},
                      @{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed:@"austenjohnson"]},
                      @{@"name" : @"Austin Nolan", @"image" : [UIImage imageNamed:@"austinnolan"]},
                      @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"derekweber"]},
                      @{@"name" : @"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"]},
                      @{@"name" : @"Heidi", @"image" : [UIImage imageNamed:@"heidi"]},
                      @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"jeffking"]},
                      @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"jefferymoulds"]},
                      @{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"jishaobukwelu"]},
                      @{@"name" : @"John Yam", @"image" : [UIImage imageNamed:@"johnyam"]},
                      @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"jonfox"]},
                      @{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed:@"savithareddy"]},
                      @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"teddyconyers"]},
                      @{@"name" : @"T.J. Mercer", @"image" : [UIImage imageNamed:@"tjmercer"]}
                                                                
                      ];
        

        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 50;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor lightGrayColor];
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 300, 30)];
        titleHeader.text = @"Iron Peeps";
        titleHeader.textColor = [UIColor whiteColor];
        
        [header addSubview:titleHeader];
        self.tableView.tableHeaderView = header;
        
        //code below is the same as the one above
        //[self.tableView setTableHeaderView: header];
        
         UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        footer.backgroundColor = [UIColor lightGrayColor];
        
        UILabel * titleFooter = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 300, 30)];
        titleFooter.text = @"this is the footer";
        titleFooter.textColor = [UIColor whiteColor];
        
        [footer addSubview:titleFooter];
        self.tableView.tableFooterView = footer;
        
        
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    // Configure the cell...
    int index = [indexPath row];
  

    
    NSDictionary * listItem = listItems[index];
    cell.textLabel.text = listItem[@"name"];
    cell.imageView.image = listItem[@"image"];
    
    
    
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
