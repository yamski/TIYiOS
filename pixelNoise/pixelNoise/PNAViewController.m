//
//  PNAViewController.m
//  pixelNoise
//
//  Created by JOHN YAM on 5/5/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PNAViewController.h"
#import "PNAPixelSounds.h"

@interface PNAViewController ()

@end

@implementation PNAViewController

{
    PNAPixelSounds * sounds;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"play sound");
    
    sounds = [[PNAPixelSounds alloc] init];
    
    [sounds playSoundWithName:@"echo_alert"];
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
