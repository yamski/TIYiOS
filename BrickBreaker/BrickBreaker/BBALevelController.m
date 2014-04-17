//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by JOHN YAM on 4/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "BBALevelController.h"

// adding a delegate. Allows contoller to know collison happened btween 2 items
@interface BBALevelController () <UICollisionBehaviorDelegate>

// declaring properties here makes them private. .h = public
@property (nonatomic) UIView * paddle;
@property (nonatomic) NSMutableArray * balls;
@property (nonatomic) NSMutableArray * bricks;

// dynamics animator. Manages all the interactions/animations that are happening. talks to the controller
@property (nonatomic) UIDynamicAnimator * animator;

// starts and push ball off in one direction. To get the ball going when we first start the app
@property (nonatomic) UIPushBehavior * pusher;

// handles the collision
@property (nonatomic) UICollisionBehavior * collider;

// item behavior properties. giving weight properties to the brick and paddles so they stay still when the ball bounce of it.
@property (nonatomic) UIDynamicItemBehavior * paddleDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicProperties;

// item attachment. tells where the item will move in the screen. kinda of a hack which we may change. If we set the paddle weight too heavy it barely moves. this fixes it
@property (nonatomic) UIAttachmentBehavior * attacher;

@end

///////////////
///////////////
///////////////

@implementation BBALevelController
{
    float paddleWidth;
}

///////////////
///////////////
///////////////

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        paddleWidth = 80;
        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];
        self.view.backgroundColor = [UIColor colorWithRed:0.549f green:0.655f blue:0.690f alpha:1.0f];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)resetLevel
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self createPaddle];
    
}

- (void) createPaddle
{
    self.paddle = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2, SCREEN_HEIGHT - 6, paddleWidth, 6)];
    
    self.paddle.backgroundColor = [UIColor colorWithRed:0.224f green:0.690f blue:0.122f alpha:1.0f];
    
    self.paddle.layer.cornerRadius = 3;
    
    [self.view addSubview: self.paddle];
}

- (void) createBricks
{
    
}

- (void) createBalls
{
    
}
@end
