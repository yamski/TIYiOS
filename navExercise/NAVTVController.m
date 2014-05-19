//
//  NAVTVController.m
//  navExercise
//
//  Created by JOHN YAM on 5/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "NAVTVController.h"
#import "NAVTVCell.h"
#import "NAVsingletonData.h"

@interface NAVTVController ()

@end

@implementation NAVTVController
{
    BOOL colorIsSelected;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
     colorIsSelected = YES;
        
        self.tableView.separatorInset = UIEdgeInsetsZero;
        
        self.tableView.separatorColor = [UIColor cyanColor];
        
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
    
    
    
    UIBarButtonItem * colorButton = [[UIBarButtonItem alloc] initWithTitle:@"Colors" style:UIBarButtonItemStylePlain target:self action:@selector(launchColors)];
    
    UIBarButtonItem * numberButton = [[UIBarButtonItem alloc] initWithTitle:@"Numbers" style:UIBarButtonItemStylePlain target:self action:@selector(launchNumbers)];
    
    
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    [self setToolbarItems:@[flexible, colorButton, flexible, numberButton, flexible] animated:YES];
    
    //[self.navigationController setToolbarItems:@[flexible, colorButton, flexible, numberButton, flexible] animated:YES];
}

-(void) launchColors
{
    colorIsSelected = YES;
    [self.tableView reloadData];
}

-(void) launchNumbers
{   colorIsSelected = NO;
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    self.navigationController.toolbarHidden = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (colorIsSelected == YES) {
        return [[NAVsingletonData mainData].colors count];
    } else {
        return [[NAVsingletonData mainData].numbers count];
    }
    
}


- (NAVTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NAVTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[NAVTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    //cell.index = indexPath.row;
    
    
    if (colorIsSelected == YES)
        {
            cell.textLabel.text = [NAVsingletonData mainData].colors[indexPath.row];
            return cell;
            
        } else
        {
            cell.textLabel.text = [[NAVsingletonData mainData].numbers[indexPath.row] stringValue];
            return cell;
        }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray * viewColors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor yellowColor]];
    
    
    UIViewController * selectView = [[UIViewController alloc]init];
    selectView.view.backgroundColor = viewColors[indexPath.row];
    
    [self.navigationController pushViewController:selectView animated:YES];
   // [self.view addSubview:selectView];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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
