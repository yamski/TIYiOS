//
//  PNAWorldVController.m
//  pixelNoise
//
//  Created by JOHN YAM on 5/5/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PNAWorldVController.h"

#import "PNAPixelSounds.h"

#import <AVFoundation/AVFoundation.h>


@interface PNAWorldVController () <UICollisionBehaviorDelegate>


@property (nonatomic) NSMutableArray * blocks;

@property (nonatomic) UIPushBehavior * pusher;

@property (nonatomic) UIDynamicAnimator * animator;

@property (nonatomic) UIDynamicItemBehavior * blockDynamicProp;

@property (nonatomic) UICollisionBehavior * collider;

@property (nonatomic) UIGravityBehavior * gravityBehavior;


@end

@implementation PNAWorldVController
{
    
    UIView *block;
    
    PNAPixelSounds * sounds;
  
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [super viewDidLoad];
        
         self.blocks = [@[] mutableCopy];

    }
    return self;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self.view];

        block = [[UIView alloc]initWithFrame:CGRectMake(location.x, location.y, 15, 15)];
        
        block.backgroundColor = [UIColor greenColor];
        
        [self.blocks addObject:block];
        
        [self.view addSubview: block];
        
        ////
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:self.blocks];
        
        [self.animator addBehavior: self.gravityBehavior];
        
        
        
        self.collider = [[UICollisionBehavior alloc]initWithItems:self.blocks];
        
        self.collider.collisionDelegate = self;
        
        self.collider.collisionMode = UICollisionBehaviorModeBoundaries;
        
        self.collider.translatesReferenceBoundsIntoBoundary = YES;
        
        
        int w = self.view.frame.size.width;
        int h = self.view.frame.size.height;

        [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h) toPoint:CGPointMake(w, h)];
        
        [self.animator addBehavior:self.collider];
    
        
//        self.pusher = [[UIPushBehavior alloc]initWithItems:self.blocks mode:UIPushBehaviorModeInstantaneous];
//        
//        self.pusher.pushDirection = CGVectorMake(0.0, 0.1);
//        
//        self.pusher.active = YES; // bc push is instataneous, it will only happend once
//        
//        [self.animator addBehavior:self.pusher];
    }
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    
    
    // specifying the identifer as an NSString
    if ([(NSString *)identifier isEqualToString:@"floor"])
    {
        
         NSLog(@"collided");
       
        sounds = [[PNAPixelSounds alloc] init];
        
        [sounds playSoundWithName:@"echo_alert"];
        
        // specifying the id
        
       // UIView * block = (UIView *)item;
        
        //[block removeFromSuperview];
        //[self.collider removeItem:block];
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
   
    
    

    

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
