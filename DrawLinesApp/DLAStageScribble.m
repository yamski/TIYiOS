//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by JOHN YAM on 4/15/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble
{
    NSMutableArray * scribbles;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        //defaults
        self.lineWidth = 2.0;
        self.lineColor = [UIColor lightGrayColor];
        self.backgroundColor = [UIColor whiteColor];
        
        scribbles = [@[] mutableCopy];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineWidth(context, self.lineWidth);
    
    
    //this resets something?
    //CGContextClearRect(context, rect);
    
     [self.lineColor set];
    
    for (NSDictionary * scribble in scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"]floatValue]);
        
        [(UIColor *)scribble[@"color"]set];
        
        NSArray * points = scribble[@"points"];
        
        //start the line
        CGPoint start = [points[0] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);

        
        
        for (NSValue * value in points)
        {
//            int index = [scribble indexOfObject:value];
            
            CGPoint point = [value CGPointValue];
            
            //NSLog(@"%d", index);
            
            //add points beyond the initial point bc its greater than 0
            //if (index > 0)
            CGContextAddLineToPoint(context, point.x, point.y);
            
        }
        CGContextStrokePath(context);
    }
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        //must turn location (it's a struct) into an object
        // need a dictionary of points to make the line and a dictionary for color of lines
        [scribbles addObject:[@{
                                @"color":self.lineColor,
                                @"width": @(self.lineWidth), //@() turns the float to an NSObject
                                @"points": [@[[NSValue valueWithCGPoint:location]] mutableCopy]
                                
                                } mutableCopy]];
    }
    
    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
         CGPoint location = [touch locationInView:self];
        
        
        //where using addObjects bc the we're adding points as we're drawing
        //we're not using addObjects with the straight lines bc theres only a start & end pt.
        [[scribbles lastObject] [@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [[scribbles lastObject] [@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
    [self setNeedsDisplay];
}

-(void)setLineWidth:(float)lineWidth
{
    //this is what the setter looks behind the scenes
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

-(void)setLineColor:(UIColor *)newColor
{
    _lineColor = newColor;
    [self setNeedsDisplay];
}




@end
