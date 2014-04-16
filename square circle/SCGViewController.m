//
//  SCGViewController.m
//  square circle
//
//  Created by JOHN YAM on 4/11/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SCGViewController.h"
#import "SCGCircle.h"
#import "SCGSquares.h"


@interface SCGViewController ()

@end

@implementation SCGViewController
{
    int gameSize;
    NSArray * playerColors;
    int playersTurn;
    NSMutableDictionary * tappedDots;
    NSMutableDictionary * allSquares;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        playerColors = @[GREEN_COLOR, PINK_COLOR];
        
        playersTurn = 0;
        
        tappedDots = [@{} mutableCopy];
        allSquares = [@{} mutableCopy];
        NSLog(@"screen width %f, screen height %f", SCREEN_WIDTH, SCREEN_HEIGHT);
        
       
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad]; //when the view controller loads on the screen
    
     gameSize = 4;
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth / 2;
    
    //create squares
    for (int sRow = 0; sRow < gameSize - 1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize - 1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
            
            SCGSquares * square = [[SCGSquares alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            
            square.backgroundColor = [UIColor lightGrayColor];
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d",sCol,sRow]; //0,1 will say c0r1
            
            allSquares[key] = square;
            
            [self.view addSubview:square];
            
        }

    }
    
    // create circles
    for (int row = 0; row < gameSize; row++)
    {
        
        for (int col = 0; col < gameSize; col++)
        {
            float circleX = circleWidth * col;
            float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
            
            SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
            
            
            
            circle.position = (CGPoint){col, row};
            
            circle.delegate = self;
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d", col, row];
            
            tappedDots [key] = @2;
            
            [self.view addSubview:circle];
        }
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
