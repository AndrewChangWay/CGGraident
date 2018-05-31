//
//  CCView.m
//  渐变色
//
//  Created by zzq on 2018/5/31.
//  Copyright © 2018年 zzq. All rights reserved.
//

#import "CCView.h"

@implementation CCView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) [UIColor redColor].CGColor, (__bridge id) [UIColor orangeColor].CGColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);

    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(0,0);
    CGPoint endPoint = CGPointMake(1, 1);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
   
}
@end
