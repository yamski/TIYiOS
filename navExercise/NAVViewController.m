//
//  NAVViewController.m
//  navExercise
//
//  Created by JOHN YAM on 5/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "NAVViewController.h"
#import "NAVTVController.h"
#import "NAVTableView.h"

@interface NAVViewController ()

@end

@implementation NAVViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        
        UIButton * pushButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/ 2 - 50, SCREEN_HEIGHT /2 - 50, 100, 100)];
        
        pushButton.backgroundColor = [UIColor brownColor];
        [pushButton setTitle:@"PUSH" forState:UIControlStateNormal];
        pushButton.titleLabel.font = [UIFont systemFontOfSize: 30];
        pushButton.layer.cornerRadius = 50;
        
        [pushButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [pushButton addTarget:self action:@selector(pushTableview:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:pushButton];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushTableview:(id)sender
{
    NAVTVController * tvc = [[NAVTVController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:tvc animated:YES];
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
