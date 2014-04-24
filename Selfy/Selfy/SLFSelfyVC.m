//
//  SLFSelfyVC.m
//  Selfy
//
//  Created by JOHN YAM on 4/22/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SLFSelfyVC.h"


@interface SLFSelfyVC () <UITextViewDelegate>
{
    UIView * newForm;
    UITextView * captionField;
}

@end

@implementation SLFSelfyVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        newForm = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 280, self.view.frame.size.height - 40)];
        
        [self.view addSubview:newForm];
        
        UIView * cameraView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 280, 280)];
        
        cameraView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        
        [newForm addSubview:cameraView];
        
        
        captionField = [[UITextView alloc]initWithFrame:CGRectMake(0, 310, 280, self.view.frame.size.height -400)];
        
        captionField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        [newForm addSubview:captionField];
        captionField.keyboardType = UIKeyboardTypeTwitter;
        captionField.delegate = self;
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, 280, 30)];
        [submitButton  setTitle:@"Submit" forState:UIControlStateNormal];
        submitButton.backgroundColor = [UIColor darkGrayColor];
        
        [submitButton addTarget:self action:@selector(newSelfy)
               forControlEvents:UIControlEventTouchUpInside];
        
        [newForm addSubview:submitButton];
        
        
//        UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(280 - 120, 400, 120, 30)];
//        [cancelButton  setTitle:@"Cancel" forState:UIControlStateNormal];
//        cancelButton.backgroundColor = [UIColor darkGrayColor];
//        
//        [cancelButton addTarget:self action:@selector(newSelfy)
//               forControlEvents:UIControlEventTouchUpInside];
//        
//        [newForm addSubview:cancelButton];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
    }
    
    return self;
}

-(void)newSelfy
{
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(20, (20 - KB_HEIGHT), 280, self.view.frame.size.height);}];

}

-(void)tapScreen
{
    [captionField resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(20, 20, 280, self.view.frame.size.height -40);}];
   
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
