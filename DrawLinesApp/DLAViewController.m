//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by JOHN YAM on 4/15/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStageLines.h"
#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController
{
    DLAStageScribble * scribbleView;
    UIView * colorsDrawer;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
       //self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];
      //self.view = [[DLAStageScribble alloc] initWithFrame:self.view.frame];

        
  
        
//        UIButton * buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(30, 380, 50, 50)];
//        buttonOne.layer.cornerRadius = 10;
//        buttonOne.backgroundColor = [UIColor greenColor];
//        [buttonOne addTarget:self action:@selector(clickedColorButton:)
//            forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:buttonOne];
//        
//        UIButton * buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(100, 380, 50, 50)];
//        buttonTwo.layer.cornerRadius = 10;
//        buttonTwo.backgroundColor = [UIColor yellowColor];
//        [buttonTwo addTarget:self action:@selector(clickedColorButton:)
//            forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:buttonTwo];
//        
//        UIButton * buttonThree = [[UIButton alloc] initWithFrame:CGRectMake(170, 380, 50, 50)];
//        buttonThree.layer.cornerRadius = 10;
//        buttonThree.backgroundColor = [UIColor redColor];
//        [buttonThree addTarget:self action:@selector(clickedColorButton:)
//            forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:buttonThree];
        
    }
    

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:scribbleView];
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 43, 280, 23)];
    
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    
    colorsDrawer = [[UIView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 40)];
    NSArray *  colors = @[
                          [UIColor colorWithRed:0.204f green:0.282f blue:0.369f alpha:1.0f],
                          [UIColor colorWithRed:0.682f green:0.173f blue:0.486f alpha:1.0f],
                          [UIColor colorWithRed:0.196f green:0.682f blue:0.478f alpha:1.0f],
                          [UIColor colorWithRed:0.835f green:0.831f blue:0.082f alpha:1.0f],
                          [UIColor colorWithRed:0.835f green:0.490f blue:0.169f alpha:1.0f]
                          ];
    
    float buttonWidth = SCREEN_WIDTH / [colors count];
    
    for (UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        
        //first index of array is 0
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        button.backgroundColor = color;
        [button addTarget:self action:@selector(clickedColorButton:)forControlEvents:UIControlEventTouchUpInside];

        [colorsDrawer addSubview:button];
    }
    
    [self.view addSubview:colorsDrawer];
    
    [self.view addSubview:slider];
}

- (void)clickedColorButton:(UIButton *)sender
{
    [scribbleView setLineColor: sender.backgroundColor];
}

-(void)changeSize:(UISlider *)sender
{
    [scribbleView setLineWidth:sender.value];
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
