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
    
    float lineWidth;
    UIColor *lineColor;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        lineColor = [UIColor purpleColor];
        lineWidth = 5.0;
    }
    

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    
    [self toggleStage];
    
    [self.view addSubview:scribbleView];
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 43, 280, 23)];
    
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    slider.value = lineWidth;
    
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
    
    UIButton * toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 80, 40, 40)];
    toggleButton.backgroundColor = [UIColor purpleColor];
    toggleButton.layer.cornerRadius = 10;
    [toggleButton setTitle:@"brush" forState:UIControlStateNormal];
    toggleButton.titleLabel.font = [UIFont systemFontOfSize:12];
    toggleButton.titleLabel.textColor = [UIColor whiteColor];
    
    [toggleButton addTarget:self action:@selector(toggleStage)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toggleButton];
 
    
    ///////
    
    UIButton * undoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 130, 40, 40)];
    undoButton.backgroundColor = [UIColor orangeColor];
    undoButton.layer.cornerRadius = 10;
    [undoButton setTitle:@"undo" forState:UIControlStateNormal];
    undoButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    
    [undoButton addTarget:self action:@selector(undoStage)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:undoButton];
    
    /////
    
    UIButton * clearButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 180, 40, 40)];
    clearButton.backgroundColor = [UIColor blueColor];
    clearButton.layer.cornerRadius = 10;
    [clearButton setTitle:@"clear" forState:UIControlStateNormal];
    clearButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [clearButton addTarget:self action:@selector(clearStage)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:clearButton];

    /////
    
    UIButton * emailButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 230, 40, 40)];
    emailButton.backgroundColor = [UIColor clearColor];
    emailButton.layer.cornerRadius = 10;
    //emailButton.layer.borderColor = [UIColor lightGrayColor];
//    [[emailButton layer] setBorderWidth:2.0f];
//    [[emailButton layer] setBorderColor:[UIColor greenColor].CGColor];
    
    [emailButton setImage:[UIImage imageNamed:@"email"] forState:UIControlStateNormal];
    emailButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
//    [emailButton addTarget:self action:@selector()
//          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:emailButton];
    
    
}

- (void)undoStage
{
    [scribbleView undoStage];
}

- (void)clearStage
{
    [scribbleView clearStage];
}

- (void)toggleStage
{
    //temporary array to grab the lines as were switching UIView
    NSMutableArray * lines = scribbleView.lines;
    
    
    //remove starting view
    [scribbleView removeFromSuperview];
    
    
    //directing pointer to new view object
    if ([scribbleView isMemberOfClass:[DLAStageScribble class]]) {
        scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    } else {
        scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    }
    
    //keeps the value of the color and size when we switch brush
    scribbleView.lineWidth = lineWidth;
    scribbleView.lineColor = lineColor;
    
    //add the lines to the array so we can switch brushes without clearing previous drawing
    if(lines != nil) scribbleView.lines = lines;
    
    [self.view insertSubview:scribbleView atIndex:0];
    
}

- (void)clickedColorButton:(UIButton *)sender
{
    [scribbleView setLineColor: sender.backgroundColor];
    lineColor = sender.backgroundColor;
    
}

-(void)changeSize:(UISlider *)sender
{
    [scribbleView setLineWidth:sender.value];
    lineWidth = sender.value;
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
