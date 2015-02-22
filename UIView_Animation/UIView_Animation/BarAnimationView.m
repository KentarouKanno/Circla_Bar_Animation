//
//  CircleView.m
//  UIView_Animation
//
//  Created by KentarOu on 2015/02/21.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "BarAnimationView.h"

#define ANIMATION_TIME 3.0
#define VALUE_LABEL_COLOR [UIColor blackColor]

@implementation BarAnimationView
{
    UIColor *barColor;
    NSString *endValueString;
    
    CGFloat endValue;
    BOOL needDrawAnimation;
}

- (id)initWithFrame:(CGRect)frame endValue:(CGFloat)value drawAnimation:(BOOL)animation {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        barColor = [UIColor colorWithRed:1.000 green:0.158 blue:0.267 alpha:1.000];
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = barColor.CGColor;
        self.layer.borderWidth = 1;
        
        endValue = value;
        needDrawAnimation = animation;
        
        endValueString = [NSString stringWithFormat:@"%d",(int)(value * 100)];
    
        
        [self drawAnimation];
        
        [self makeValueLabel];
    }
    return self;
}

- (void) makeValueLabel {
    
    UIView *baseVeiw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    baseVeiw.backgroundColor = [UIColor clearColor];
    
    UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 35, 20)];
    valueLabel.backgroundColor = [UIColor clearColor];
    valueLabel.font = [UIFont systemFontOfSize:20];
    valueLabel.text = endValueString;
    valueLabel.textColor = VALUE_LABEL_COLOR;
    [valueLabel sizeToFit];
    [baseVeiw addSubview:valueLabel];
    
    
    UILabel *percnetLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(valueLabel.frame), CGRectGetMaxY(valueLabel.frame) - 15, 10, 10)];
    percnetLabel.backgroundColor = [UIColor clearColor];
    percnetLabel.font = [UIFont systemFontOfSize:12];
    percnetLabel.text = @"%";
    percnetLabel.textColor = VALUE_LABEL_COLOR;
    [percnetLabel sizeToFit];
    [baseVeiw addSubview:percnetLabel];
    
    baseVeiw.frame = CGRectMake(0, 0, valueLabel.frame.size.width + percnetLabel.frame.size.width, valueLabel.frame.size.height);
    baseVeiw.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    [self addSubview:baseVeiw];
    
}

- (void) drawAnimation {
    
    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, self.frame.size.height)];
    barView.backgroundColor = barColor;
    [self addSubview:barView];
    
    if (needDrawAnimation) {
        
        [UIView animateWithDuration:ANIMATION_TIME delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            barView.frame = CGRectMake(0, 0, self.frame.size.width * endValue, self.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    } else {
        barView.frame = CGRectMake(0, 0, self.frame.size.width * endValue, self.frame.size.height);
    }
}



@end
