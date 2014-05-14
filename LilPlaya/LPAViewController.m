//
//  LPAViewController.m
//  LilPlaya
//
//  Created by JOHN YAM on 5/13/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "LPAViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface LPAViewController ()
{
    AVAudioPlayer * player;
    UIView * seekButton;
    UIView * progressBar;
    
    UISlider * volumeSlider;
    
    UIButton * playButton;
    UIButton * stopButton;
    
    UILabel * songCounter;
    
    int w;
    int h;
}

@end

@implementation LPAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        w = [UIScreen mainScreen].bounds.size.width;
        h = [UIScreen mainScreen].bounds.size.height;
        
        progressBar = [[UIView alloc]initWithFrame:CGRectMake(70, (h-50)/2 + 66, w -140, 2)];
        progressBar.backgroundColor= [UIColor grayColor];
        [self.view addSubview:progressBar];
        
        seekButton = [[UIView alloc]initWithFrame:CGRectMake(70, (h-50)/2 + 57, 20, 20)];
        seekButton.backgroundColor = [UIColor orangeColor];
        seekButton.layer.cornerRadius = 10;
        [self.view addSubview:seekButton];
        
        volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 120, 150, 2)];
        volumeSlider.minimumValue = 0.0;
        volumeSlider.maximumValue = 1.0;
        volumeSlider.value = .5;
        [volumeSlider addTarget:self action:@selector(volumeControl) forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:volumeSlider];
        
        songCounter = [[UILabel alloc]initWithFrame:CGRectMake(150, 40, 120, 30)];
        songCounter.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:songCounter];
        
        songCounter.text = [NSString stringWithFormat:@"0:00"];
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^{
            
            NSURL * url = [NSURL URLWithString:@"https://api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3"];
            
            NSData * data = [NSData dataWithContentsOfURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                player = [[AVAudioPlayer alloc] initWithData:data error:nil];
                
               // [stopButton addTarget:***player*** action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
                
            //NSLog(@"player ready");
                
                
                playButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 50, 50)];
                playButton.backgroundColor = [UIColor greenColor];
                
                
                [playButton setImage:[UIImage imageNamed:@"play-512.png"] forState:UIControlStateNormal];
                [playButton addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
                
                [self.view addSubview:playButton];
                
                stopButton = [[UIButton alloc]initWithFrame:CGRectMake(80, 30, 50, 50)];
                stopButton.backgroundColor = [UIColor redColor];
                
                [stopButton setImage:[UIImage imageNamed:@"stop-512.png"] forState:UIControlStateNormal];
                
                [stopButton addTarget:self action:@selector(stopPlay) forControlEvents:UIControlEventTouchUpInside];
                
                [self.view addSubview:stopButton];
  
            });
        });
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)playAction:(id)sender
{
    if([player isPlaying])
    {
        [sender setImage:[UIImage imageNamed:@"pause-512.png"] forState:UIControlStateNormal];
        [player pause];
        //[self pauseTimer];
        
    }else{
        [sender setImage:[UIImage imageNamed:@"play-512.png"] forState:UIControlStateNormal];
        [player play];
        //[self resumeTimer];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    }
    
}

-(void)stopPlay
{
    [player stop];
    
    seekButton.frame = CGRectMake(70, (h-50)/2 + 57, 20, 20);
    
    [self.timer invalidate];
    self.timer = nil;
    player.currentTime = 0;
    
    [playButton setImage:[UIImage imageNamed:@"play-512.png"] forState:UIControlStateNormal];
    [self updateTimer:[player currentTime]];
    
}

-(void)updateProgress:(NSTimer *)sender
{
    NSTimeInterval currentTime = [player currentTime];
    NSTimeInterval duration = [player duration];
    CGFloat progress = currentTime/duration;
    
    float xPosition= progressBar.frame.origin.x + progress * progressBar.frame.size.width;
    
    NSLog(@"%f", [player currentTime]);
    
    seekButton.frame = CGRectMake(xPosition, (h-50)/2 + 57, 20, 20);
    
    [self updateTimer:[player currentTime]];
}

- (void)updateTimer:(float)time
{
    NSInteger interval = (NSInteger)time;
   // double milliseconds = (time - interval) * 1000;
    NSInteger seconds = interval % 60;
    NSInteger minutes = (interval / 60) % 60;
    minutes += (interval / 60);
    
    //songCounter.text = [NSString stringWithFormat:@"%02ld:%02ld:%3.0f", (long)minutes, (long)seconds, milliseconds];
   
    songCounter.text = [NSString stringWithFormat:@"%02ld:%02ld", (long)minutes, (long)seconds];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void) volumeControl
{
    player.volume = [volumeSlider value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
