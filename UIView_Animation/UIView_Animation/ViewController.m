//
//  ViewController.m
//  UIView_Animation
//
//  Created by KentarOu on 2015/02/20.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "ViewController.h"
#import "CircleAnimationView.h"
#import "BarAnimationView.h"
#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    CircleView *circle = [[CircleView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)
//                                                 endValue:0.85
//                                            drawAnimation:NO];
//    
//    [self.view addSubview:circle];
    
    CircleAnimationView *circle = [[CircleAnimationView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)
                                                                   endValue:0.85
                                                              drawAnimation:YES];
    
    [self.view addSubview:circle];
    
    
    BarAnimationView *bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(50, 150, 200, 25)
                                                                   endValue:0.85
                                                              drawAnimation:YES];
    
    [self.view addSubview:bar];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
