//
//  TVPTableViewController.m
//  tableViewPractice
//
//  Created by JOHN YAM on 4/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TVPTableViewController.h"

@interface TVPTableViewController ()

@end

@implementation TVPTableViewController

{
    NSMutableArray *listItems;
    UITextField * nameField;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        listItems = [@[
                       @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"alihoushmand"], @"github" :@"https://github.com/HoushmandA06" },
                       @{@"name" : @"Ashby Thornwell", @"image" : [UIImage imageNamed:@"ashbythornwell"], @"github" :@"https://github.com/athornwell"},
                       @{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed:@"austenjohnson"], @"github" :@"https://github.com/ajohnson21"},
                       @{@"name" : @"Austin Nolan", @"image" : [UIImage imageNamed:@"austinnolan"], @"github" :@"https://github.com/adnolan99"},
                       @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"derekweber"], @"github" :@"https://github.com/dweber03"},
                       @{@"name" : @"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"], @"github" :@"https://github.com/MadArkitekt"},
                       @{@"name" : @"Heidi", @"image" : [UIImage imageNamed:@"heidi"], @"github" :@"https://github.com/justagirlcoding"},
                       @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"jeffking"], @"github" :@"https://github.com/rampis"},
                       @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"jefferymoulds"], @"github" :@"https://github.com/jdmgithub"},
                       @{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"jishaobukwelu"], @"github" :@"https://github.com/Jiobu"},
                       @{@"name" : @"John Yam", @"image" : [UIImage imageNamed:@"johnyam"], @"github" :@"https://github.com/yamski"},
                       @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"jonfox"], @"github" :@"https://github.com/FoxJon"},
                       @{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed:@"savithareddy"], @"github" :@"https://github.com/savithareddy"},
                       @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"teddyconyers"], @"github" :@"https://github.com/talented76"},
                       @{@"name" : @"T.J. Mercer", @"image" : [UIImage imageNamed:@"tjmercer"], @"github" :@"https://github.com/gwanunig14"}
                       
                       ] mutableCopy];
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.rowHeight = 100;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        header.backgroundColor = [UIColor yellowColor];
        self.tableView.tableHeaderView = header;
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 280, 30)];
        titleHeader.text = @"GitHub Users";
        titleHeader.textColor = [UIColor grayColor];
        [header addSubview:titleHeader];
        
        nameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, 160, 30)];
        [header addSubview:nameField];
        nameField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        nameField.delegate = self;
        
        
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 0;
}


@end
