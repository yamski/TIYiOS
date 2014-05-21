//
//  EMOsmilieVC.m
//  Status
//
//  Created by JOHN YAM on 5/19/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "EMOsmilieVC.h"
#import "STTwitter.h"

@interface EMOsmilieVC ()

@property (nonatomic) BOOL twitterOn;
@property (nonatomic) BOOL googleOn;
@property (nonatomic) BOOL fbOn;


@end


@implementation EMOsmilieVC
{
    NSArray * bigSmilies;
    UIImageView * bigSmilie;
    STTwitterAPI * twitter;

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        
         bigSmilies = @[@"yellow_1.png", @"yellow_2.png", @"yellow_3.png", @"yellow_4.png", @"yellow_5.png", @"yellow_6.png", @"yellow_7.png", @"yellow_8.png", @"yellow_9.png"];
        
        twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
        
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
            
            NSLog(@"%@", username);
            
        } errorBlock:^(NSError *error) {
            
            NSLog(@"%@", error.userInfo);
            
        }];
        
        NSLog(@"%d",self.twitterOn);
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
  //  if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view.
    
    NSArray * socialIcons = @[@"sm_twitter_g", @"sm_google_g", @"sm_facebook_g"];
    
    NSArray * socialHighlighted = @[@"sm_twitter", @"sm_google", @"sm_facebook"];
    
   for (int i = 0; i < 3; i++)
   {
       UIButton * socialButtons = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2 - 92) + 68 *i , 40, 48, 48)];
       socialButtons.tag = i;
       [socialButtons setImage:[UIImage imageNamed: socialIcons[i]] forState:UIControlStateNormal];
       [socialButtons setImage:[UIImage imageNamed: socialHighlighted[i]] forState:UIControlStateSelected];
       
       [socialButtons addTarget:self action:@selector(iconSwitch:) forControlEvents: UIControlEventTouchUpInside];
       [self.view addSubview:socialButtons];
       
    }
    
    UIButton * arrow = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 -72, SCREEN_HEIGHT - 80, 48, 56)];
    
    arrow.transform=CGAffineTransformMakeRotation(M_PI / -1);
    
    [arrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [arrow addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:arrow];
    
    UIButton * check = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 2, SCREEN_HEIGHT - 70, 62, 40)];
    [check setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [check addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:check];
}

-(void)loadSmilie:(NSInteger)num
{
    bigSmilie = [[UIImageView alloc]initWithImage: [UIImage imageNamed: bigSmilies[num]]];
    bigSmilie.frame = CGRectMake(SCREEN_WIDTH / 2 -96, SCREEN_HEIGHT/2 -96, 192, 192);
    
    [self.view addSubview:bigSmilie];
    
}

- (void)iconSwitch:(UIButton *)sender
{
    [sender setSelected:!sender.selected];
    
    if (sender.tag == 0) {
        
        _twitterOn = !_twitterOn;
        
        NSLog(@"%d",self.twitterOn);
    }
    else if (sender.tag == 2){
        
    _fbOn = !_fbOn;
        
    }
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
    //[self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
}

- (void)publish
{
    
    if (_twitterOn)
    {
        
        NSLog(@"twitter on");
        
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documentPath = paths[0];
        
        NSData * imageData = UIImagePNGRepresentation(bigSmilie.image);
        
        NSString* pngPath = [documentPath stringByAppendingPathComponent:@"big_smilie.png"];
        [imageData writeToFile:pngPath atomically:YES];
        NSURL * url = [NSURL fileURLWithPath:pngPath];
        
        [twitter postStatusUpdate:@"app test" inReplyToStatusID:nil mediaURL:url placeID:nil latitude:nil longitude:nil uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
            NSLog(@"posted!");
        } successBlock:^(NSDictionary *status) {
            
            NSLog(@"%@", status);
            
        } errorBlock:^(NSError *error) {
             NSLog(@"%@", error.userInfo);
        }];
        
    } else
    {
        NSLog(@"twitter off");
        return;
    }
    
    
//    if (_fbOn) {
//        NSLog(@"FB on");
//    }
//    else
//    {
//        NSLog(@"FB off");
//    }
    
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
