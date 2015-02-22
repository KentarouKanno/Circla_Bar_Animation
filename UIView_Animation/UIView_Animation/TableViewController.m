//
//  TableViewController.m
//  UIView_Animation
//
//  Created by KentarOu on 2015/02/22.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "TableViewController.h"
#import "CircleView.h"
#import "CircleAnimationView.h"
#import "BarAnimationView.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 150;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
//    for (id view in [cell subviews]) {
//        if ([view isKindOfClass:[CircleView class]]) {
//            [view removeFromSuperview];
//        }
//    }
    
    
    for (id view in [cell subviews]) {
        if ([view isKindOfClass:[CircleAnimationView class]]) {
            [view removeFromSuperview];
        }
    }
    
    for (id view in [cell subviews]) {
        if ([view isKindOfClass:[BarAnimationView class]]) {
            [view removeFromSuperview];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    if (indexPath.row < 5) {
        
//        CircleView *circle = [[CircleView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)
//                                                     endValue:0.25
//                                                drawAnimation:YES];
//        circle.circleColor = [UIColor redColor];
//        
//        [cell addSubview:circle];
//        
//        CircleView *circle1 = [[CircleView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)
//                                                      endValue:0.50
//                                                 drawAnimation:YES];
//        
//        [cell addSubview:circle1];
//        
//        
//        CircleView *circle2 = [[CircleView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)
//                                                      endValue:0.75
//                                                 drawAnimation:YES];
//        
//        [cell addSubview:circle2];
//        
//        CircleView *circle3 = [[CircleView alloc]initWithFrame:CGRectMake(300, 0, 100, 100)
//                                                      endValue:0.99
//                                                 drawAnimation:YES];
//        
//        [cell addSubview:circle3];
        
        
        CircleAnimationView *circle = [[CircleAnimationView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)
                                                     endValue:0.25
                                                drawAnimation:YES];
        
        [cell addSubview:circle];
        
        CircleAnimationView *circle1 = [[CircleAnimationView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)
                                                      endValue:0.50
                                                 drawAnimation:YES];
        
        [cell addSubview:circle1];
        
        
        CircleAnimationView *circle2 = [[CircleAnimationView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)
                                                      endValue:0.75
                                                 drawAnimation:YES];
        
        [cell addSubview:circle2];
        
        CircleAnimationView *circle3 = [[CircleAnimationView alloc]initWithFrame:CGRectMake(300, 0, 100, 100)
                                                      endValue:0.99
                                                 drawAnimation:YES];
        
        [cell addSubview:circle3];
        
        BarAnimationView *bar;
        
        switch (indexPath.row) {
            case 0:
                
                bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(100, 110, 200, 25) endValue:0.25 drawAnimation:YES];
                break;
            case 1:
                
                bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(100, 110, 200, 25) endValue:0.50 drawAnimation:YES];
                break;
            case 2:
                
                bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(100, 110, 200, 25) endValue:0.75 drawAnimation:YES];
                break;
            case 3:
                
                bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(100, 110, 200, 25) endValue:0.99 drawAnimation:YES];
                break;
            case 4:
                
                bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(100, 110, 200, 25) endValue:0.85 drawAnimation:YES];
                break;
                
            default:
                break;
        }
        
        
        [cell addSubview:bar];
        
        
        
    } else {
//        CircleView *circle = [[CircleView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)
//                                                     endValue:0.25
//                                                drawAnimation:NO];
//        
//        [cell addSubview:circle];
//        
//        
//        CircleView *circle1 = [[CircleView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)
//                                                      endValue:0.50
//                                                 drawAnimation:NO];
//        
//        [cell addSubview:circle1];
//        
//        CircleView *circle2 = [[CircleView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)
//                                                      endValue:0.75
//                                                 drawAnimation:NO];
//        
//        [cell addSubview:circle2];
//        
//        CircleView *circle3 = [[CircleView alloc]initWithFrame:CGRectMake(300, 0, 100, 100)
//                                                      endValue:0.99
//                                                 drawAnimation:NO];
//        
//        [cell addSubview:circle3];
        
        CircleAnimationView *circle = [[CircleAnimationView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)
                                                     endValue:0.25
                                                drawAnimation:NO];
        
        [cell addSubview:circle];
        
        
        CircleAnimationView *circle1 = [[CircleAnimationView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)
                                                      endValue:0.50
                                                 drawAnimation:NO];
        
        [cell addSubview:circle1];
        
        CircleAnimationView *circle2 = [[CircleAnimationView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)
                                                      endValue:0.75
                                                 drawAnimation:NO];
        
        [cell addSubview:circle2];
        
        CircleAnimationView *circle3 = [[CircleAnimationView alloc]initWithFrame:CGRectMake(300, 0, 100, 100)
                                                      endValue:0.99
                                                 drawAnimation:NO];
        
        [cell addSubview:circle3];
        
        BarAnimationView *bar = [[BarAnimationView alloc]initWithFrame:CGRectMake(100, 120, 200, 25) endValue:0.85 drawAnimation:NO];
        [cell addSubview:bar];
    }
    
    
    
   
    
    
    
    return cell;
}


@end
