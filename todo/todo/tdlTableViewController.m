//
//  tdlTableViewController.m
//  todo
//
//  Created by JOHN YAM on 4/2/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlTableViewController.h"
#import "tdlTableViewCell.h"
#import "tdlGitHubRequest.h"




@implementation tdlTableViewController

{
    NSMutableArray *listItems;
    UITextField * nameField;
   
    
}

//- (void)toggleEdit
//{
//    [self.tableView setEditing:!self.tableView.editing animated:YES];
//
//}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
//       
//        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];
        
        
       
        
//        listItems = [@[
//                      @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"alihoushmand"], @"github" :@"https://github.com/HoushmandA06" },
//                      @{@"name" : @"Ashby Thornwell", @"image" : [UIImage imageNamed:@"ashbythornwell"], @"github" :@"https://github.com/athornwell"},
//                      @{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed:@"austenjohnson"], @"github" :@"https://github.com/ajohnson21"},
//                      @{@"name" : @"Austin Nolan", @"image" : [UIImage imageNamed:@"austinnolan"], @"github" :@"https://github.com/adnolan99"},
//                      @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"derekweber"], @"github" :@"https://github.com/dweber03"},
//                      @{@"name" : @"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"], @"github" :@"https://github.com/MadArkitekt"},
//                      @{@"name" : @"Heidi", @"image" : [UIImage imageNamed:@"heidi"], @"github" :@"https://github.com/justagirlcoding"},
//                      @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"jeffking"], @"github" :@"https://github.com/rampis"},
//                      @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"jefferymoulds"], @"github" :@"https://github.com/jdmgithub"},
//                      @{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"jishaobukwelu"], @"github" :@"https://github.com/Jiobu"},
//                      @{@"name" : @"John Yam", @"image" : [UIImage imageNamed:@"johnyam"], @"github" :@"https://github.com/yamski"},
//                      @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"jonfox"], @"github" :@"https://github.com/FoxJon"},
//                      @{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed:@"savithareddy"], @"github" :@"https://github.com/savithareddy"},
//                      @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"teddyconyers"], @"github" :@"https://github.com/talented76"},
//                      @{@"name" : @"T.J. Mercer", @"image" : [UIImage imageNamed:@"tjmercer"], @"github" :@"https://github.com/gwanunig14"}
//                                                                
//                      ] mutableCopy];

        listItems = [@[] mutableCopy];
        
        [self loadListItems];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        header.backgroundColor = [UIColor whiteColor];
        
        self.tableView.tableHeaderView = header;
        
        //code below is the same as the one above
        //[self.tableView setTableHeaderView: header];
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 280, 30)];
        titleHeader.text = @"GitHub Users";
        titleHeader.textColor = [UIColor lightGrayColor];
        //titleHeader.font = [UIFont systemFontOfSize:26];
        titleHeader.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
        [header addSubview:titleHeader];
        
        
       
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 160, 30)];
        [header addSubview:nameField];
        nameField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        nameField.layer.cornerRadius = 6;
        //the next two lines moves the blinking cursor to the right from the very left edge
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        
        nameField.delegate = self;
        
        
        [header addSubview:nameField];
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        submitButton.backgroundColor = [UIColor darkGrayColor];
        submitButton.layer.cornerRadius = 6;
        
        [submitButton addTarget:self action:@selector(newUser)
           forControlEvents:UIControlEventTouchUpInside];
        
        [header addSubview:submitButton];
        
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

-(void)newUser
{
    NSString * userName = nameField.text;
    
    nameField.text = @"";
    
//    [listItems addObject:@{
//       @"name" : userName,
//      // @"image" : [UIImage imageNamed:@"new_user"],
//       @"github" :[NSString stringWithFormat:@"https://github.com/%@",userName]}];
    
    NSDictionary * userInfo = [tdlGitHubRequest getUserWithUsername:userName];
    if([[userInfo allKeys] count] == 3)
        {
            [listItems addObject:userInfo];
        } else {
            NSLog(@"not enough data");
            
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
            
            [alertView show];
        }
    
    
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self newUser];
    return YES;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
   tdlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[tdlTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier: @"cell"];
    
    
   cell.profileInfo = [self getListItem:indexPath.row];
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem = [self getListItem:indexPath.row];
    NSLog(@"%@",listItem);
    
    UIViewController * webController = [[UIViewController alloc] init];
    
    UIWebView * webView = [[UIWebView alloc] init];
    
    webController.view = webView;
    
   
    
    [self.navigationController pushViewController:webController animated:YES];
    
    
    [webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:listItem[@"github"]]]];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[listItems removeObjectAtIndex:indexPath.row];
    
    NSDictionary * listItem = [self getListItem:indexPath.row];
    [listItems removeObjectIdenticalTo:listItem];
    //[self.tableView reloadData];
    
    tdlTableViewCell *cell = (tdlTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [self saveData];
    
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath == destinationIndexPath) return;
   
    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
    [listItems removeObjectIdenticalTo:sourceItem];
    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
    
    [self saveData];
    
}

- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}

- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listItems];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}

- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"list.data"];
}

- (void)loadListItems
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}

@end
