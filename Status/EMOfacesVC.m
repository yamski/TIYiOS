//
//  EMOfacesVC.m
//  Status
//
//  Created by JOHN YAM on 5/19/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "EMOfacesVC.h"
#import "EMOsmilieVC.h"

@interface EMOfacesVC ()

@end

@implementation EMOfacesVC
{
    UIImageView * selectSquare;
    NSInteger smilieID;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * arrow = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 -72, SCREEN_HEIGHT - 80, 48, 56)];
    
    arrow.transform=CGAffineTransformMakeRotation(M_PI / -1);
    
    [arrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [arrow addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:arrow];
    
    UIButton * check = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 2, SCREEN_HEIGHT - 70, 62, 40)];
    [check setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [check addTarget:self action:@selector(completeSmilie) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:check];
    
    selectSquare = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
    selectSquare.frame = CGRectMake(-8, -8, 64, 64);
    
   }

- (void) loadsSmilies:(NSInteger)smilieNum
{
    NSArray * smilieImages = @[
                               @[@"smilies_1", @"smilies_2", @"smilies_3", @"smilies_4", @"smilies_5", @"smilies_6", @"smilies_7", @"smilies_8", @"smilies_9"],
                               
                               @[@"angry_1", @"angry_2", @"angry_3", @"angry_4", @"angry_5", @"angry_6", @"angry_7", @"angry_8", @"angry_9"]
                               ];
    
    for (int i=0; i < 9; i++)
    {
        if(i<3)
        {
            UIButton * facesButton = [[UIButton alloc]initWithFrame:CGRectMake(72 + (i * 64), 200, 48, 48)];
            
            [facesButton setImage:[UIImage imageNamed:smilieImages[smilieNum][i]] forState:UIControlStateNormal];
            facesButton.tag = i;
            [facesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:facesButton];
        }
        
        if(i>=3 && i <6)
        {
            
            UIButton * facesButton = [[UIButton alloc]initWithFrame:CGRectMake(72 + ((i-3) * 64), 262, 48, 48)];
            [facesButton setImage:[UIImage imageNamed:smilieImages[smilieNum][i]] forState:UIControlStateNormal];
            facesButton.tag = i;
            [facesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:facesButton];
        }
        
        if(i>=6)
        {
            UIButton * facesButton = [[UIButton alloc]initWithFrame:CGRectMake(72 + ((i-6) * 64), 326, 48, 48)];
            [facesButton setImage:[UIImage imageNamed:smilieImages[smilieNum][i]] forState:UIControlStateNormal];
            facesButton.tag = i;
            [facesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:facesButton];
        }
    }
}

-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)completeSmilie
{
    EMOsmilieVC * smilieVC = [[EMOsmilieVC alloc]init];
    
    [smilieVC loadSmilie:smilieID];
    
    [self.navigationController pushViewController:smilieVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) selectedButton:(UIButton *)sender
{
    [sender insertSubview:selectSquare atIndex:0];
    
    smilieID = sender.tag;
}

//- (void)viewWillAppear:(BOOL)animated{
//    
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//}



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
