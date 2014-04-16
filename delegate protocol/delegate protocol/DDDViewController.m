//
//  DDDViewController.m
//  delegate protocol
//
//  Created by JOHN YAM on 4/14/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DDDViewController.h"
#import "DDDcustomerService.h"


@interface DDDViewController ()

@end

@implementation DDDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIView *background = [[UIView alloc] initWithFrame:self.view.frame];
        background.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:background];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
        button.backgroundColor = [UIColor lightGrayColor];
        
        [button addTarget:self action:@selector(saveButton:)
            forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
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



//this is the method being fired
- (void)didSaveCustomer:(NSString *)name
{
    UIView *newBox = [[UIView alloc]initWithFrame:CGRectMake(160, 100, 40, 40)];
    newBox.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.1];
    [self.view addSubview:newBox];
    NSLog(@"%@", name);
}

- (IBAction)saveButton:(id)sender
{
    DDDcustomerService *customerService = [[DDDcustomerService alloc]init];
    customerService.delegate = self;
    
//    [self.view addSubview:customerService];
    
    [customerService saveCustomer:@"John Doe"];
    
    //when ever you save the customer, the delegate fires the method to all the classes that conforms to the delegate
}




@end
