//
//  PNAPixelWorld2.m
//  pixelNoise
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PNAPixelWorld2.h"

#import "PNAPixelSounds.h"


@interface PNAPixelWorld2 () <UICollisionBehaviorDelegate>

@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIGravityBehavior * gravity;
@property (nonatomic) UICollisionBehavior * collision;

//shards
@property (nonatomic) UIDynamicItemBehavior * shardBehavior;
//so the can do something specific besides sounds. Also so they dont collide with our blocks
@property (nonatomic) UICollisionBehavior * shardCollision;

@end

@implementation PNAPixelWorld2
{
    PNAPixelSounds * sounds;
    
    NSArray * splatterDirections;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        sounds = [[PNAPixelSounds alloc] init];
        
        //NSValue lets you change C items to objects
        //CGVectorMake(0.0, -1.0) can't be used bc its not an object
        splatterDirections = @[
                               [NSValue valueWithCGPoint:CGPointMake(-0.1, -0.1)],
                               [NSValue valueWithCGPoint:CGPointMake(-0.5, -0.7)],
                               [NSValue valueWithCGPoint:CGPointMake(0.0, -0.9)],
                               [NSValue valueWithCGPoint:CGPointMake(0.5, -0.7)],
                               [NSValue valueWithCGPoint:CGPointMake(1.0, -0.7)],
                               ];
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        self.gravity = [[UIGravityBehavior alloc] init];
        
        //for every behavior we have, we add it to an animator
        [self.animator addBehavior:self.gravity];
        
        self.collision = [[UICollisionBehavior alloc] init];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        self.collision.collisionDelegate = self;
        
        [self.animator addBehavior:self.collision];
        
        self.shardBehavior = [[UIDynamicItemBehavior alloc] init];
        self.shardBehavior.density = 20;
        
        [self.animator addBehavior:self.shardBehavior];
        
        self.shardCollision = [[UICollisionBehavior alloc] init];
        self.shardCollision.translatesReferenceBoundsIntoBoundary = YES;
        self.shardCollision.collisionDelegate = self;
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches) {
        
        [self createBlockWithLocation:[touch locationInView:self.view]];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //the for loop is strictly for the number of fingers touching the screen. It will loop through all the touches
    
    for (UITouch * touch in touches) {
        
        [self createBlockWithLocation:[touch locationInView:self.view]];
    }
}

-(void)createBlockWithLocation:(CGPoint)location
{
    UIView * block = [[UIView alloc]initWithFrame:CGRectMake(location.x , location.y, 20, 20)];
    block.backgroundColor = [UIColor magentaColor];
    
    [self.view addSubview:block];
    
    [self.gravity addItem:block];
    
    [self.collision addItem:block];
    
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if ([behavior isEqual:self.collision])
    {
        
        [sounds playSoundWithName:@"click_alert"];
        
        //doing an inline declaration to tell the id that its a UIView
        UIView * collidedblock = (UIView *)item;
        
        [self createShardsWithLocation:p];
        [self.gravity removeItem:collidedblock];
        [self.collision removeItem:collidedblock];
        
        [collidedblock removeFromSuperview];
    }
    
    if ([behavior isEqual:self.shardCollision])
    {
        UIView * collidedShard = (UIView *)item;
        
        
        
        [self.gravity removeItem:collidedShard];
        [self.collision removeItem:collidedShard];
        
        [collidedShard removeFromSuperview];
    }
}

-(void)createShardsWithLocation:(CGPoint)location
{
    for (NSValue * pointValue in splatterDirections) {
        CGPoint direction = [pointValue CGPointValue];
        
        UIView * shard = [[UIView alloc]initWithFrame:CGRectMake(location.x, location.y, 10, 10)];
        shard.backgroundColor = [UIColor magentaColor];
        
        [self.view addSubview:shard];
        
        [self.gravity addItem:shard];
        
        [self.shardCollision addItem:shard];
        
        [self.shardBehavior addItem:shard];
        
        UIPushBehavior * pusher = [[UIPushBehavior alloc] initWithItems:@[shard] mode:UIPushBehaviorModeInstantaneous];

        
        [pusher addItem:shard];
        
        [self.animator addBehavior:pusher];
        
        pusher.pushDirection = CGVectorMake(direction.x, direction.y);
        
    }
    
}

@end
