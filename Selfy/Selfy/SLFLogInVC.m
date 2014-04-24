//
//  SLFLogInVC.m
//  Selfy
//
//  Created by JOHN YAM on 4/22/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SLFLogInVC.h"
#import <Parse/Parse.h>

@interface SLFLogInVC () <UITextViewDelegate>

@end

@implementation SLFLogInVC
{
    UITextField * logInField;
    UITextField * pwField;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIView * loginForm = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 280, 400)];
        
        [self.view addSubview:loginForm];
        loginForm.backgroundColor = [UIColor colorWithRed:0.655f green:0.745f blue:0.859f alpha:1.0f];
        
        logInField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) -100, 100, 200, 30)];
        logInField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        logInField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        logInField.leftViewMode = UITextFieldViewModeAlways;
        logInField.placeholder = @"User Name";
        
        
        logInField.delegate = self;
        [self.view addSubview:logInField];
        
        pwField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) -100, 150, 200, 30)];
        pwField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        pwField.secureTextEntry = YES;
        pwField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        pwField.leftViewMode = UITextFieldViewModeAlways;
        pwField.placeholder = @"Password";
        pwField.delegate = self;
        [self.view addSubview:pwField];
        
        UIButton * signInButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) -100, 200, 200, 30)];
        [signInButton  setTitle:@"Sign In" forState:UIControlStateNormal];
        signInButton.backgroundColor = [UIColor darkGrayColor];
        
        
        [signInButton addTarget:self action:@selector(signIn)
               forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:signInButton];
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)signIn
{
    NSString * name = logInField.text;
    NSString * pw = pwField.text;
    
    PFUser * user = [PFUser currentUser];
    
    user.username = name;
    user.password = pw;
    [user saveInBackground];
    
    logInField.text = @"";
    pwField.text = @"";
    
    
    [logInField resignFirstResponder];
    [pwField resignFirstResponder];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Return");
    [textField resignFirstResponder];
    return YES;
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
