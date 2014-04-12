//
//  SCGstageVC.m
//  ▢s & ◯s
//
//  Created by JOHN YAM on 4/11/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGSquare.h"
#import "SCGCircle.h"



@implementation SCGStageVC
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
        
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        
        playersTurn = 0;
        
        tappedDots = [@{} mutableCopy];
        
        allSquares = [@{} mutableCopy];
    }
    return self;
    
}
    //called when self.view loads on screen
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gameSize = 4;
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth / 2;
    
    
    // create square
    //gameSize - 1 , only 2 squares possible with gameSize 3 (# of columns)
    for (int sRow = 0; sRow < gameSize - 1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize - 1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2 );
            
            SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            
            square.backgroundColor = [UIColor lightGrayColor];
            
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

- (UIColor *)circleTappedWithPosition:(CGPoint)position
{
    
    
    UIColor * currentColor = playerColors[playersTurn];
    playersTurn = (playersTurn) ? 0 : 1;
    return  currentColor;
}


-(void)checkForSquareAroundPosition:(CGPoint)position
{
    @{
      @"r0c0": @0,
      @"r0c1": @1,
      @"r0c2": @2,
      };
    
    
    // x = col and y = row
    
    int pX = position.x;
    int pY = position.y;
    
    BOOL above = (pY > 0);
    BOOL below = (pY < gameSize - 1);
    BOOL left = (pX > 0);
    BOOL right = (pX < gameSize - 1);
    
    if (above && left)
    {
        //check top left quadrant
        // position 1,1
        //0,0  1,0  0,1  1,1
        for (UIColor * color in playerColors)
        {
            int player = [playerColors indexOfObject:color];
            
            // -1,-1  0,-1  -1,0  0,0
            
            NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d", pX-1, pY-1];
            NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d", pX, pY-1];
            NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d", pX-1, pY];
            NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d", pX, pY];
            
            
            //check if top left and top right are the same
            BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
            //check if bottom left and bottom right are the same
            BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
            //check if top left and bottom lefts are the same
            BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
                                  
            //if top, left, & bottom dots the same as player, then they own the square
            if(topDotsSame && bottomDotsSame && leftDotsSame && [topLeftDot isEqual:@(player)])
          {
              //player owns square
          }
            
            
        }
    }
    
    if (above && right)
    {
        //check top right quadrant
    }
    
    if (below && left)
    {
        //check botton left quadrant
    }
    
    if (below && right){
        //check bottom right quadrant
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

-(BOOL)prefersStatusBarHidden { return YES; }

@end
