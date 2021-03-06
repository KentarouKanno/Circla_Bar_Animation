//
//  CircleView.h
//  UIView_Animation
//
//  Created by KentarOu on 2015/02/21.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property (nonatomic,readwrite) UIColor *circleColor;

- (id)initWithFrame:(CGRect)frame
           endValue:(CGFloat)value
      drawAnimation:(BOOL)animation;

@end
