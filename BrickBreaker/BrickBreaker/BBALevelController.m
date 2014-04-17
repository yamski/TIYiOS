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
    float points;
}

///////////////
///////////////
///////////////

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        points = 0;
        paddleWidth = 80;
        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];
        self.view.backgroundColor = [UIColor colorWithRed:0.549f green:0.655f blue:0.690f alpha:.5f];
        
        
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
    
    [self createBall];
    
    [self createBricks];
    
    //init with all the items on the stage
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    
    self.collider.collisionDelegate = self;
    
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    
    //the view's bounds is the boundry
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collider];
    
    self.ballsDynamicProperties = [self createPropertiesForItems:self.balls];
    self.bricksDynamicProperties = [self createPropertiesForItems:self.bricks];
    
    //converting to literal array and passing array into method
    self.paddleDynamicProperties = [self createPropertiesForItems:@[self.paddle]];
    
    
    // stop paddle and bricks from moving. Depedant on size of ball
    self.paddleDynamicProperties.density = 100000;
    self.bricksDynamicProperties.density = 100000;
    
    self.ballsDynamicProperties.elasticity = 1.0;
    self.ballsDynamicProperties.resistance = 0.0;
    
    
}

//when a collison happends we are using UICollision delegate.
//item 1 and 2 are colliding, do something
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    UIView * tempBrick;
    
    for (UIView * brick in self.bricks)
    {
        //isEqual knows the difference between objects, == doesn't
        if ([item1 isEqual:brick] || [item2 isEqual:brick])
        {
            
            
            if (brick.alpha == 0.5)
            {
                
                tempBrick = brick;
               
                [brick removeFromSuperview];
                [self.collider removeItem:brick];
                
                points += 100;
                
                //points = points + 100;
                NSLog(@"Total points = %f", points);
                
                [self pointLabelWithBrick:brick];
            }
        
            brick.alpha = 0.5;
        }
    }
    if (tempBrick != nil) [self.bricks removeObjectIdenticalTo:tempBrick];
    
}

- (void)pointLabelWithBrick:(UIView *)brick
{
    UILabel *pointLabel = [[UILabel alloc] initWithFrame:brick.frame];
    pointLabel.backgroundColor = [UIColor clearColor];
    pointLabel.text = @"+100";
    [self.view addSubview: pointLabel];
    
    
    
}

-(UIDynamicItemBehavior *)createPropertiesForItems:(NSArray *)items
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc]initWithItems:items];
    properties.allowsRotation = NO;
    properties.friction = 0.0;
    [self.animator addBehavior:properties];
    
    return properties;
}


- (NSArray *)allItems
{
    NSMutableArray * items = [@[self.paddle] mutableCopy];
    
    // adding these items to the array
    
    for (UIView * item in self.balls) [items addObject:item];
    for (UIView * item in self.bricks) [items addObject:item];
    
    
    return items;
}
                     
                     
- (void) createPaddle
{
    self.paddle = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2, SCREEN_HEIGHT - 20, paddleWidth, 6)];
    
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    self.paddle.layer.cornerRadius = 3;
    
    [self.view addSubview: self.paddle];
}

- (void) createBricks
{
    int brickCols = 6;
    float brickWidth = (SCREEN_WIDTH - (10 * (brickCols + 1))) / brickCols;
    
    for (int i = 0; i < brickCols; i++)
    {
        float brickX = ((brickWidth + 10) * i) +10;
        
        UIView * brick = [[UIView alloc]initWithFrame:CGRectMake( brickX, 10, brickWidth, 30)];
        
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
        
        
//        for (int i = 0; i < 1; i++)
//        {
//            float brickX = ((brickWidth + 10) * i) +10;
//            
//            UIView * brick = [[UIView alloc]initWithFrame:CGRectMake( brickX, brickX + 40, brickWidth, 30)];
//            
//            brick.layer.cornerRadius = 6;
//            brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
//            
//            [self.view addSubview:brick];
//            [self.bricks addObject:brick];
//            
//        }

     }

}

- (void) createBall
{
    CGRect frame = self.paddle.frame;
    
    //origin is a CGPoint. It is the top left corner of your frame. In this case the frame is the paddle
    
    UIView * ball = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y - 12, 10, 10)];
    
    ball.backgroundColor = [UIColor orangeColor];
    
    ball.layer.cornerRadius = 5;
    
    [self.view addSubview:ball];
    
    // Start ball of with a push
    
    //add ball to balls array
    [self.balls addObject:ball];
    
    //add array of balls
    self.pusher = [[UIPushBehavior alloc]initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    
    //be cautious. the size of the object will affect the speed of the push
    self.pusher.pushDirection = CGVectorMake(0.02, 0.02);
    
    self.pusher.active = YES; // bc push is instataneous, it will only happend once
    
    [self.animator addBehavior:self.pusher];
}
@end
