//
//  EMOcolorsVC.m
//  Status
//
//  Created by JOHN YAM on 5/19/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "EMOcolorsVC.h"
#import "EMOfacesVC.h"

@interface EMOcolorsVC ()

@end

@implementation EMOcolorsVC
{
    UIImageView * selectSquare;
    
    NSInteger colorValue;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray * colorImages = @[@"colors_1", @"colors_2", @"colors_3", @"colors_4", @"colors_5", @"colors_6",
                              @"colors_7", @"colors_8", @"colors_9"];
    
    for (int i=0; i < 9; i++)
    {
       
        if(i<3)
        {
            UIButton * colorButton = [[UIButton alloc]initWithFrame:CGRectMake(72 + (i * 64), 200, 48, 48)];
            colorButton.tag = i;
            [colorButton setImage:[UIImage imageNamed:colorImages[i]] forState:UIControlStateNormal];
            [colorButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:colorButton];
        }
        
        if(i>=3 && i <6)
        {
            
            UIButton * colorButton = [[UIButton alloc]initWithFrame:CGRectMake(72 + ((i-3) * 64), 262, 48, 48)];
            colorButton.tag = i;
            [colorButton setImage:[UIImage imageNamed:colorImages[i]] forState:UIControlStateNormal];
            [colorButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:colorButton];
        }
        
        if(i>=6)
        {
            UIButton * colorButton = [[UIButton alloc]initWithFrame:CGRectMake(72 + ((i-6) * 64), 326, 48, 48)];
            colorButton.tag = i;
            [colorButton setImage:[UIImage imageNamed:colorImages[i]] forState:UIControlStateNormal];
            [colorButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:colorButton];
        }
    }
    
    
    UIButton * arrow = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 -32, SCREEN_HEIGHT - 80, 48, 56)];
    [arrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [arrow addTarget:self action:@selector(smilieVC) forControlEvents:UIControlEventTouchUpInside];
 
    [self.view addSubview:arrow];
    
    selectSquare = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
    selectSquare.frame = CGRectMake(-8, -8, 64, 64);
}

- (void) selectedButton:(UIButton *)sender
{    
    [sender insertSubview:selectSquare atIndex:0];
    
    colorValue = sender.tag;
}

//- (void)viewWillAppear:(BOOL)animated{
//
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}

-(void)smilieVC
{
    EMOfacesVC * facesVC = [[EMOfacesVC alloc] init];
    
    [self.navigationController pushViewController:facesVC animated:YES];
    
    [facesVC loadsSmilies:colorValue];
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
