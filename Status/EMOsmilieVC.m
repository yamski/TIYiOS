//
//  EMOsmilieVC.m
//  Status
//
//  Created by JOHN YAM on 5/19/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "EMOsmilieVC.h"

@interface EMOsmilieVC ()

@property (nonatomic) BOOL twitterOn;
@property (nonatomic) BOOL googleOn;
@property (nonatomic) BOOL fbOn;


@end


@implementation EMOsmilieVC
{
    UIButton * socialButtons;
    NSArray * socialIcons;
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
    // Do any additional setup after loading the view.
    
    socialIcons = @[@"sm_twitter_g", @"sM_google_g", @"sm_facebook_g"];
    
   
    
   for (int i = 0; i < 3; i++)
   {
       socialButtons = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2 - 92) + 68 *i , 40, 48, 48)];
       socialButtons.tag = i;
       [socialButtons setImage:[UIImage imageNamed: socialIcons[i]] forState:UIControlStateNormal];
       
       [socialButtons addTarget:self action:@selector(connectSocial:) forControlEvents: UIControlEventTouchUpInside];
       [self.view addSubview:socialButtons];
       
    }
    
    
    UIButton * check = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 -32, SCREEN_HEIGHT - 80, 62, 40)];
    [check setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [check addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:check];
    
}

-(void)loadSmilie:(int)num
{
    NSArray * bigSmilies = @[@"yellow_1.png", @"yellow_2.png", @"yellow_3.png", @"yellow_4.png", @"yellow_5.png", @"yellow_6.png", @"yellow_7.png", @"yellow_8.png", @"yellow_9.png"];
    
    UIImageView * bigSmilie = [[UIImageView alloc]initWithImage: [UIImage imageNamed: bigSmilies[num]]];
    bigSmilie.frame = CGRectMake(SCREEN_WIDTH / 2 -96, SCREEN_HEIGHT/2 -96, 192, 192);
    
    [self.view addSubview:bigSmilie];
    
}


- (void)publish
{
    
}

- (void)connectSocial:(UIButton *)sender
{
     NSArray * socialHighlighted = @[@"sm_twitter", @"sm_google", @"sm_facebook"];
    
    switch (sender.tag)
    {
        case 0:
            
            if( [[sender imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"sm_twitter_g"]])
            {
               [sender setImage:[UIImage imageNamed: socialHighlighted[0]] forState:UIControlStateNormal];
            }
            else
            {
                [sender setImage:[UIImage imageNamed: socialIcons[0]] forState:UIControlStateNormal];
            }
            
            break;
        case 1:
            if( [[sender imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"sM_google_g"]])
            {
                [sender setImage:[UIImage imageNamed: socialHighlighted[1]] forState:UIControlStateNormal];
            }
            else
            {
                [sender setImage:[UIImage imageNamed: socialIcons[1]] forState:UIControlStateNormal];
            }
            
            break;
        case 2:
            if( [[sender imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"sm_facebook_g"]])
            {
                [sender setImage:[UIImage imageNamed: socialHighlighted[1]] forState:UIControlStateNormal];
            }
            else
            {
                [sender setImage:[UIImage imageNamed: socialIcons[1]] forState:UIControlStateNormal];
            }
           
            break;
        
        default:
            NSLog (@"Integer out of range");
            break;
    }
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
