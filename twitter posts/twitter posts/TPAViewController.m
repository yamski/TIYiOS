//
//  TPAViewController.m
//  twitter posts
//
//  Created by JOHN YAM on 5/20/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TPAViewController.h"
#import "STTwitter.h"

@interface TPAViewController ()

@end


@implementation TPAViewController
{
    STTwitterAPI * twitter;
    UITextView * tweetField;
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
        
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
            
            NSLog(@"%@", username);
            
        } errorBlock:^(NSError *error) {
            
            NSLog(@"%@", error.userInfo);
            
        }];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    
    int h = [UIScreen mainScreen].bounds.size.height;

    
    tweetField = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, w - 40, h - 100)];
    tweetField.backgroundColor = [UIColor colorWithRed:0.839f green:0.980f blue:0.957f alpha:1.0f];
    
    [self.view addSubview:tweetField];
   
    UIButton * post = [[UIButton alloc]initWithFrame:CGRectMake(0, h - 60, w, 60)];
    post.backgroundColor = [UIColor grayColor];
    
    [post setTitle:@"Post" forState:UIControlStateNormal];
    
    [post addTarget:self action:@selector(postIt) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:post];
}

- (void)postIt
{
    [twitter postStatusUpdate:tweetField.text inReplyToStatusID:nil latitude:nil longitude:nil placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        
        NSLog(@"%@", status);
        
    } errorBlock:^(NSError * error){
        
        NSLog(@"%@", error.userInfo);
        
    }];
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
