//
//  CircleView.m
//  UIView_Animation
//
//  Created by KentarOu on 2015/02/21.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "CircleAnimationView.h"

#define ANIMATION_TIME 3.0
#define LINE_WIDTH 20
#define VALUE_LABEL_COLOR [UIColor darkGrayColor]

@implementation CircleAnimationView
{
    UIColor *circleColor;
    NSString *endValueString;
    
    CGFloat endValue;
    BOOL needDrawAnimation;
}

- (id)initWithFrame:(CGRect)frame endValue:(CGFloat)value drawAnimation:(BOOL)animation {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        // 円グラフのカラーを設定
        circleColor = [UIColor blueColor];
        endValue = value;
        needDrawAnimation = animation;
        
        endValueString = [NSString stringWithFormat:@"%d",(int)(value * 100)];
    
        [self drawAnimation];
        [self makeValueLabel];
    }
    return self;
}

- (void) makeValueLabel {
    
    UILabel *valueLabel = [[UILabel alloc]init];
    valueLabel.backgroundColor = [UIColor clearColor];
    valueLabel.font = [UIFont systemFontOfSize:25];
    valueLabel.text = endValueString;
    valueLabel.textColor = VALUE_LABEL_COLOR;
    [valueLabel sizeToFit];
    valueLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - 8);
    [self addSubview:valueLabel];
    
    
    UILabel *percnetLabel = [[UILabel alloc]init];
    percnetLabel.backgroundColor = [UIColor clearColor];
    percnetLabel.font = [UIFont systemFontOfSize:18];
    percnetLabel.text = @"%";
    percnetLabel.textColor = VALUE_LABEL_COLOR;
    [percnetLabel sizeToFit];
    percnetLabel.frame = CGRectMake(CGRectGetMinX(valueLabel.frame) + ((valueLabel.frame.size.width - percnetLabel.frame.size.width) / 2), CGRectGetMaxY(valueLabel.frame) - 3, percnetLabel.frame.size.width, percnetLabel.frame.size.height);
    [self addSubview:percnetLabel];
}

- (void) drawAnimation {
    
    // 半径
    int radius = self.frame.size.width / 2 - LINE_WIDTH / 2;
    CAShapeLayer *circle = [CAShapeLayer layer];
    
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(LINE_WIDTH / 2,
                                                                     LINE_WIDTH / 2,
                                                                     2.0 * radius,
                                                                     2.0 * radius)cornerRadius:radius].CGPath;
    
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = circleColor.CGColor;
    circle.lineWidth = LINE_WIDTH;
    
    [self.layer addSublayer:circle];
    
    
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    if (!needDrawAnimation) {
        // アニメーション無し
        drawAnimation.beginTime = 1;
    }
    
    drawAnimation.duration = ANIMATION_TIME;
    drawAnimation.fromValue = @0.0;
    drawAnimation.toValue = [NSNumber numberWithFloat:endValue];
    drawAnimation.fillMode = kCAFillModeForwards;
    drawAnimation.removedOnCompletion = NO;
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
}




- (void)drawRect:(CGRect)rect {
    
    // 円の枠（外側）を生成
    UIBezierPath* arcOut = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2,
                                                                          self.frame.size.height / 2)
                                                       radius:self.frame.size.width / 2 - 1
                                                   startAngle:0
                                                     endAngle:M_PI * 2
                                                    clockwise:YES];

    [circleColor setStroke];
    arcOut.lineWidth = 1;
    [arcOut stroke];
    
    
    // 円の枠（内側）を生成
    UIBezierPath* arcIn = [UIBezierPath bezierPathWithArcCenter: CGPointMake(self.frame.size.width / 2,
                                                                             self.frame.size.height / 2)
                                                         radius:self.frame.size.width / 2 - LINE_WIDTH
                                                     startAngle:0
                                                       endAngle:M_PI * 2
                                                      clockwise:YES];
    [circleColor setStroke];
    arcIn.lineWidth = 1;
    [arcIn stroke];
}


@end
