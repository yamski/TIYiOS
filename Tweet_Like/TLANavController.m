//
//  TLANavController.m
//  Tweet_Like
//
//  Created by JOHN YAM on 4/23/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TLANavController.h"
#import "TLATableVC.h"

@interface TLANavController () <UITextViewDelegate>

@end

@implementation TLANavController
{
    UIButton * addNew;
    UIView * blueBox;
    UIView * newForm;
    UIImageView * logo;
    UITextView * textBox;
    
    TLATableVC * TVC;
    
}


    //we aren't calling this method in the app delegate
//- (id)initWithRootViewController:(UIViewController *)rootViewController
//{
//    self = [super initWithRootViewController:rootViewController];
//    if (self)
//    {
//
//    }
//    
//    return self;
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.471f green:0.663f blue:0.859f alpha:1.0f];
    self.navigationBar.translucent = NO;
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.471f green:0.663f blue:0.859f alpha:1.0f];
    [self.view addSubview:blueBox];
    
    
    
    addNew = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2) - 50, 7, 100, 30)];
    addNew.layer.cornerRadius = 10;
    addNew.backgroundColor = [UIColor whiteColor];
    [addNew setTitleColor:[UIColor colorWithRed:0.267f green:0.376f blue:0.486f alpha:1.0f] forState:UIControlStateNormal];
    [addNew setTitle:@"Add New" forState:UIControlStateNormal];
    addNew.titleLabel.font = [UIFont systemFontOfSize:12];
    [blueBox addSubview:addNew];
    
    //put : bc we're sending button
    [addNew addTarget:self action:@selector(newTweet:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    logo = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2) - 87.5, 110, 175, 45)];
    logo.image = [UIImage imageNamed:@"logo"];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
    [self.view addGestureRecognizer:tap];
}


//allows us to pass table view controller through and know what it is
//at some point, we'll have multiple controllers. This will allow us to remember to TVController
 //adding a child view controller

- (void)addTableViewController:(TLATableVC *)viewController  //???
{
    
    TVC = viewController;
   
    [self pushViewController:viewController animated:NO];
    
    if ([TVC isTweetItemsEmpty])
    {
        //manually sending the button
        [self newTweet:addNew];
        
        //same as above line
        //[addNew addTarget:self action:@selector(newTweet:) forControlEvents:UIControlEventTouchUpInside];

     //[self newTweet:nil];
    }
    
}

-(void)tapScreen
{
    [textBox resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);}];
    
}

-(void)newTweet:(UIButton *)sender
{
    [UIView animateWithDuration:0.4 animations:^{

        //the button will disappear here
        //        self.navigationBar.frame = self.view.frame;
        //        addNew.alpha = 0.0;
        
        blueBox.frame = self.view.frame;
        addNew.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        newForm = [[UIView alloc]initWithFrame:self.view.frame];
        newForm.backgroundColor = [UIColor clearColor];
        [self.view addSubview:newForm];
        
        [newForm addSubview:logo];
        
        UIView * newTweetView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        newTweetView.backgroundColor = [UIColor colorWithRed:0.471f green:0.663f blue:0.859f alpha:1.0f];
    
        textBox = [[UITextView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2) - 125, 170, 250, 150)];
        textBox.clipsToBounds = YES;
        textBox.layer.cornerRadius = 10.0f;
        textBox.delegate = self;
        [newForm  addSubview:textBox];
        
        UIButton * submit = [[UIButton alloc]initWithFrame:CGRectMake(40, 340, 100, 30)];
        submit.backgroundColor =[UIColor colorWithRed:0.086f green:0.859f blue:0.337f alpha:1.0f] ;
        submit.layer.cornerRadius = 10;
        [submit setTitle: @"Submit" forState: UIControlStateNormal];
        [newForm  addSubview:submit];
        [submit addTarget:self action:@selector(submitTweet)forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton * cancel = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 140, 340, 100, 30)];
        cancel.backgroundColor = [UIColor colorWithRed:0.859f green:0.110f blue:0.373f alpha:1.0f];
        [cancel setTitle: @"Cancel" forState: UIControlStateNormal];
        cancel.layer.cornerRadius = 10;
        [newForm addSubview:cancel];
        
        [cancel addTarget:self action:@selector(cancelTweet)forControlEvents:UIControlEventTouchUpInside];
  }];
   
}

-(void)submitTweet
{
    if([textBox.text isEqualToString:@""]) return;
    
    [TVC.tweetItems insertObject:@{
                                @"likes": @0,
                                @"tweet": textBox.text
                                } atIndex:0];
    [TVC.tableView reloadData];
    
    [newForm removeFromSuperview];
    [blueBox removeFromSuperview];
    
    //NSString * newTweet = textBox.text;
  
    //NSLog(@"Class of base VC %@", [self.viewControllers[0] class]);
    
    //TLATableVC * tableVC = (TLATableVC *)self.viewControllers[0]; // our NavController contains the TableVC.
    
    //[tableVC loadNewTweet:newTweet];
}

-(void)cancelTweet
{
    [newForm removeFromSuperview];
    
    [UIView animateWithDuration:0.4 animations:^{
        
        blueBox.frame = self.navigationBar.frame;
        addNew.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        [newForm addSubview:logo];
    }];

}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0, (60 - KB_HEIGHT), SCREEN_WIDTH, self.view.frame.size.height);}];
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
