//
//  DLAStages.m
//  DrawLinesApp
//
//  Created by JOHN YAM on 4/15/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines
{
    NSMutableArray * lines;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        lines = [@[] mutableCopy];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


*/


//drawing on the View
-(void)drawRect:(CGRect)rect
{
    //drawing code

    
    //context is a struct
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //[[UIColor blackColor] set];
    [self.lineColor set];
    

//    CGContextClearRect(context, rect);
    
    
    //lineWidth is avaiable bc its a subclass of StageScribble
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    NSLog(@"%@",lines);
    
    
    for (NSDictionary * line in lines)
    {
        
        //this allows up to change colors and line width as we are drawing
        CGContextSetLineWidth(context, [line[@"width"]floatValue]);
        
        [(UIColor *)line[@"color"]set];

        
        
        //array in points key
        CGPoint start = [line[@"points"][0] CGPointValue];
        CGPoint end = [line[@"points"][1] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);
        CGContextAddLineToPoint(context, end.x, end.y);
        
        //says stroke the path you created
        CGContextStrokePath(context);
    }
    
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        //CGPoint is a C struct, not an object
        CGPoint location = [touch locationInView:self];
        
//        [lines addObject:[@[
//                            [NSValue valueWithCGPoint: location],
//                            [NSValue valueWithCGPoint:location]
//                            ] mutableCopy]];
        
        //added from scribble
        
        //each drawing line is a dictionary of keys
        [lines addObject:[@{
                                @"color":self.lineColor,
                                @"width": @(self.lineWidth), //@() turns the float to an NSObject
                                @"points": [@[[NSValue valueWithCGPoint:location],
                                              [NSValue valueWithCGPoint:location],
                                              
                                              ] mutableCopy]
                                
                                } mutableCopy]];
        
        NSLog(@"Touch X %f Y %f",location.x, location.y);
    }
    
    //tells it to redraw itself
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        //second point in the last object. 2nd point get updated every time it moves
        
        [lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];
        
        NSLog(@"Touch X %f Y %f",location.x, location.y);
    }
    
      [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        //second point in the last object
        //selects second point in array
        [lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];

        
        NSLog(@"Touch X %f Y %f",location.x, location.y);
    }
    
      [self setNeedsDisplay];
}

@end
