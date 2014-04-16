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
    [[UIColor blackColor] set];

//    CGContextClearRect(context, rect);
    
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    NSLog(@"%@",lines);
    
    
    for (NSArray * line in lines)
    {
        CGPoint start = [line[0] CGPointValue];
        CGPoint end = [line[1] CGPointValue];
        
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
        
        [lines addObject:[@[
                            [NSValue valueWithCGPoint: location],
                            [NSValue valueWithCGPoint:location]
                            ] mutableCopy]];
        
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
        
        //second point in the last object
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];
        
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
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];

        
        NSLog(@"Touch X %f Y %f",location.x, location.y);
    }
    
      [self setNeedsDisplay];
}

@end
