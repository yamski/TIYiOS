//
//  SABGameScene.m
//  Stuffed Animal Battle
//
//  Created by JOHN YAM on 5/15/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SABGameScene.h"
@interface SABGameScene()<SKPhysicsContactDelegate>

@end

@implementation SABGameScene
{
    SKLabelNode * timerLabel;
    SKSpriteNode * player1HPBar;
    SKSpriteNode * player2HPBar;
    
    SKSpriteNode * buttonA;
    SKSpriteNode * buttonB;
    
    SKSpriteNode * dpadUp;
    SKSpriteNode * dpadDown;
    SKSpriteNode * dpadLeft;
    SKSpriteNode * dpadRight;
    
    SKSpriteNode * player1;
    SKSpriteNode * player2;
    
    NSInteger p1HP;
    NSInteger p2HP;
    NSInteger totalDamage;
    float barArea;
    SKSpriteNode * player2damage;
    
    SKTextureAtlas * charAtlas;
    SKTextureAtlas * danceAtlas;
    
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self)
    {
        SKPhysicsBody * scenePhysics = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, size.width, size.height)];
        
        self.physicsBody = scenePhysics;
        
        self.backgroundColor = [SKColor whiteColor];
        
        self.physicsWorld.contactDelegate = self;
        
        timerLabel = [SKLabelNode node];
        timerLabel.position = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT - 30);
        
        timerLabel.text = @"00:00";
        timerLabel.fontColor = [SKColor whiteColor];
        timerLabel.fontSize = 15;
        
        [self addChild:timerLabel];
        
        
        barArea = ((SCREEN_WIDTH - 60)/ 2.0) - 60;
        
        player1HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
        
        player1HPBar.position = CGPointMake((barArea/2.0 + 20), SCREEN_HEIGHT - 23);
        
        [self addChild:player1HPBar];
        

        player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
        
        player2HPBar.position = CGPointMake(SCREEN_WIDTH - (barArea/2.0 + 20), SCREEN_HEIGHT - 23);
        
        [self addChild:player2HPBar];
        
        
        buttonA = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        
        buttonA.position = CGPointMake(SCREEN_WIDTH - 40, 80);
        
        [self addChild:buttonA];
        
        //
        buttonB = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonB.position = CGPointMake(SCREEN_WIDTH - 80, 40);
        [self addChild:buttonB];
        
        dpadDown = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadDown.position  = CGPointMake(80, 40);
        [self addChild:dpadDown];
        
        dpadUp = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadUp.position  = CGPointMake(80, 120);
        [self addChild:dpadUp];
        
        dpadLeft = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadLeft.position  = CGPointMake(40, 80);
        [self addChild:dpadLeft];
        
        dpadRight = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadRight.position  = CGPointMake(120, 80);
        [self addChild:dpadRight];
        
        
        //player1 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];
        //player1 = [SKSpriteNode spriteNodeWithImageNamed:@"dude1.png"];
    
        
        charAtlas = [SKTextureAtlas atlasNamed:@"char"];
        
        for (NSString * textureName in charAtlas.textureNames) {
            NSLog(@"%@", textureName);
        }
        
        player1 = [SKSpriteNode spriteNodeWithImageNamed:charAtlas.textureNames[0]];
        player1.position = CGPointMake(100, 100);
        [self addChild:player1];
        
        ////
        danceAtlas = [SKTextureAtlas atlasNamed:@"dance"];
        
        NSMutableArray *dancetextures = [@[] mutableCopy];
        
        for (int i = 1; i < danceAtlas.textureNames.count + 1; i++) {
            NSLog(@"charframe%d",i);

            [dancetextures addObject:[danceAtlas textureNamed: [NSString stringWithFormat: @"dance%d",i]]];
        }
        
        SKAction * dance = [SKAction animateWithTextures:dancetextures timePerFrame:0.2];
        
        SKAction * danceAllNight = [SKAction repeatActionForever: dance];
        
        [player1 runAction:danceAllNight];
        
        ////
    
        SKPhysicsBody * player1Physics = [SKPhysicsBody bodyWithRectangleOfSize:player1.size];
        player1.physicsBody = player1Physics;
        
        
//        player2 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];
        player2 = [SKSpriteNode spriteNodeWithImageNamed:@"dude2.png"];
        

        player2.position = CGPointMake(700, 100);
        [self addChild:player2];
        
        
        
        SKPhysicsBody * player2Physics = [SKPhysicsBody bodyWithRectangleOfSize:player2.size];
        player2.physicsBody = player2Physics;
        
        player2.userData = [@{@"type":@"player2"}mutableCopy];
        
        player2.physicsBody.categoryBitMask = 1;

        
        SKSpriteNode * floor = [SKSpriteNode spriteNodeWithColor:[SKColor magentaColor] size:CGSizeMake(SCREEN_WIDTH, 30)];
        
        floor.position = CGPointMake(SCREEN_WIDTH/2.0, 10);
        
        [self addChild:floor];
        
        SKPhysicsBody * floorPhysics = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        
        floorPhysics.affectedByGravity = NO;
        
        floorPhysics.dynamic = NO;
        
        floor.physicsBody = floorPhysics;
        
        p1HP = 100;
        p2HP = barArea;
        
        player2damage = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(barArea, 20)];
    }
    return self;
}

-(void)buttonAclicked:(id)sender
{
    NSLog(@"button clicked");
    
    NSLog(@"Fire");
    
    NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"FireParticle" ofType:@"sks"];
    
    SKEmitterNode * fireball = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    
    
    fireball.position = CGPointMake(player1.position.x + 100.0, player1.position.y);
    
    SKPhysicsBody * fireballPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 10)];
    
    fireballPhysics.affectedByGravity = NO;
    
    fireball.physicsBody = fireballPhysics;
    
    
    fireball.userData = [@{@"type":@"fireball"} mutableCopy];
    
    fireball.physicsBody.contactTestBitMask = 1;
    
    [self addChild:fireball];
    
    [fireball.physicsBody applyImpulse:CGVectorMake(5.0, 0)];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    //NSLog(@"contact");
    NSLog(@"%@",contact.bodyA.node.userData[@"type"]);
    NSLog(@"%@",contact.bodyB.node.userData[@"type"]);
    
    NSMutableArray * nodes = [@[] mutableCopy];
    
    if (contact.bodyA.node != nil) [nodes addObject:contact.bodyA.node];
    if (contact.bodyB.node != nil) [nodes addObject:contact.bodyB.node];
    
    for (SKNode * node in nodes)
    {
    
        if ([node.userData[@"type"] isEqualToString:@"fireball"])
        {
            [node removeFromParent];
            
            NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"sks"];
            
            SKEmitterNode * explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
            
            explosion.position = contact.contactPoint;
            
            explosion.numParticlesToEmit = 200;
            
            [self addChild:explosion];
            
            [self runAction:[SKAction playSoundFileNamed:@"Blip 001.wav" waitForCompletion:NO]];
            
            [self runAction:[SKAction playSoundFileNamed:@"grunt.wav" waitForCompletion:NO]];
            
            [self damage];
            
            if (p2HP <= 0 ) {
                NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"snow" ofType:@"sks"];
                
                SKEmitterNode * explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
                
                explosion.position = contact.contactPoint;
                
                explosion.numParticlesToEmit = 200;
                
                [self addChild:explosion];
                
                if ([node.userData[@"type"] isEqualToString:@"fireball"])
                {
                    [player2.physicsBody applyImpulse:CGVectorMake(550, 600)];
                    
                    //player2.color = [SKColor magentaColor];
                    
                    CGPoint player2location = CGPointMake(player2.position.x, player2.position.y);
                    
                    
                    for (int i = 0; i < 5; i++) {
                        SKSpriteNode * player2blocks = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(10, 10)];
                        player2blocks.position = CGPointMake(player2location.x + (i * 30), player2location.y + 150 + (i *4));
                        SKPhysicsBody * player2blockPhysics = [SKPhysicsBody bodyWithRectangleOfSize:player2blocks.size];
                        player2blocks.physicsBody = player2blockPhysics;
                        [self addChild:player2blocks];
                        
                        [self runAction:[SKAction playSoundFileNamed:@"Effect 001.wav" waitForCompletion:NO]];
                        
                        [self runAction:[SKAction playSoundFileNamed:@"finishhim.mp3" waitForCompletion:NO]];

                    }
                }
            }
            
        }
    
    }
}

- (void) damage
{
    [player2damage removeFromParent];
    
    NSInteger damagepts = -80;
    
    p2HP += damagepts;
    
    totalDamage = totalDamage + damagepts;
    
    NSLog(@"%ld", (long)p2HP);
    
    NSLog(@"total damage: %ld", totalDamage);
    
    player2damage.position = CGPointMake(SCREEN_WIDTH - (barArea/2.0 + 20) + (totalDamage/2), SCREEN_HEIGHT - 23);

    //player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
    
    player2damage.size = CGSizeMake(barArea + totalDamage, 20);
    
    [self addChild:player2damage];
    
    if (p2HP <= 0){
        
        [player2damage removeFromParent];
        
        UILabel *finishHim = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 250, SCREEN_HEIGHT/2 - 50, 500, 100)];
        finishHim.backgroundColor = [UIColor redColor];
        
        finishHim.text = @"FINISH HIM!!!";
        finishHim.textAlignment = NSTextAlignmentCenter;
        finishHim.font = [UIFont systemFontOfSize:70];
        [self.view addSubview:finishHim];
        
        [player1.physicsBody applyImpulse:CGVectorMake(0, 100)];
  
    }
}

//anyObject is the UItouch object
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //CGPoint location = [[touches anyObject] locationInNode:self];
    
    UITouch * touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
//    NSLog(@"%f, %f", location.x, location.y);
//    
//    NSLog(@"%u", [buttonA containsPoint:location]);
    
    [self testButtinWithLocation:location];
}

- (void)testButtinWithLocation:(CGPoint)location
{
    NSArray * buttons = @[buttonA, buttonB, dpadUp, dpadDown, dpadLeft, dpadRight];
    
    for (SKNode * button in buttons)
    {
        if ([button containsPoint:location])
        {
             NSLog(@"button%lu", (unsigned long)[buttons indexOfObject:button]);
            
            switch ([buttons indexOfObject:button])
            {
                case 0: //button A
                {
                    NSLog(@"Fire");
                    
                    NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"FireParticle" ofType:@"sks"];
                    
                    SKEmitterNode * fireball = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
                    
                 
                    fireball.position = CGPointMake(player1.position.x + 100.0, player1.position.y);
                    
                    SKPhysicsBody * fireballPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 10)];
                    
                    fireballPhysics.affectedByGravity = NO;
                    
                    fireball.physicsBody = fireballPhysics;
                    
                    
                    fireball.userData = [@{@"type":@"fireball"} mutableCopy];
                    
                    fireball.physicsBody.contactTestBitMask = 1;
                    
                    [self addChild:fireball];
                    
                    [fireball.physicsBody applyImpulse:CGVectorMake(5.0, 0)];
                }
                    break;
                    
                case 1: //button B
                    NSLog(@"Kick");
                    break;
                    
                case 2: //up
                {
                    NSMutableArray *textures = [@[] mutableCopy];
                    
                    NSLog(@"up");
                    [player1.physicsBody applyImpulse:CGVectorMake(0, 100)];
                    
                    for (int i = 1; i < charAtlas.textureNames.count + 1; i++) {
                        NSLog(@"charframe%d",i);
                        
                        [textures addObject:[charAtlas textureNamed: [NSString stringWithFormat: @"charframe%d",i]]];
                    }
                    
                    SKAction * setFrame2 = [SKAction animateWithTextures:textures timePerFrame:0.1];
                    
                    [player1 runAction:setFrame2];
   
                }
                    break;
                    
                case 3: //down
                {
                    NSLog(@"down");
                    SKAction * moveDown = [SKAction moveToY: player1.position.y - 20 duration:0.1];
                    [player1 runAction:moveDown];
                    
                    [self runAction:[SKAction playSoundFileNamed:@"flawless.wav" waitForCompletion:NO]];

                }
                    break;
                    
                case 4: //left
                {
                    NSLog(@"left");
                    
//                    SKAction * moveLeft = [SKAction moveToX: player1.position.x - 5 duration:0.1];
//                    [player1 runAction:moveLeft];
                    
                    [player1.physicsBody applyImpulse:CGVectorMake(-300, 0)];
                    
                }
                    break;
                    
                case 5: //right
                {
                    NSLog(@"right");
                    
                    [player1.physicsBody applyImpulse:CGVectorMake(300, 0)];
                }
                    break;
                    
//                default:
//                    break;
            }
        }
       
    }
}

@end
