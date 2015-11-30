//
//  TSLinearInterp.m
//  TestDrawingLinearInterp
//
//  Created by Mac on 30.11.15.
//  Copyright © 2015 Tsvigun Alexandr. All rights reserved.
//

#import "TSLinearInterp.h"

@interface TSLinearInterp ()

@property (strong, nonatomic) UIBezierPath *path;

@end

@implementation TSLinearInterp


- (id)initWithCoder:(NSCoder *)aDecoder // (1)
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.path = [[UIBezierPath alloc]init];
        
        [self setMultipleTouchEnabled:NO]; // (2)
        [self setBackgroundColor:[UIColor whiteColor]];
        self.path = [UIBezierPath bezierPath];
        [self.path setLineWidth:10.0]; // толщина линии
        [self.path setLineCapStyle:kCGLineCapRound];
        NSLog(@"initWithCoder");
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    [[UIColor blueColor] setStroke];
    [self.path stroke];
    NSLog(@"drawRect");
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.path moveToPoint:point];
    NSLog(@"touchesBegan");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.path addLineToPoint:point]; // (4)
    [self setNeedsDisplay];
    NSLog(@"touchesMoved");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}


@end
