//
//  ViewController.m
//  Shapes
//
//  Created by Jide Opeola on 1/13/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import "Rectangle.h"
#import "Triangle.h"
#import "Ellipse.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width




// Make 3 Classes based on UIView (Rectangle, Ellipse, Triangle)

// Uncomment the drawRect function

// Google CGContext drawing in drawRect

////// Subclass of UIView (alloc initwithframe ---CGRect)

// 10 different shapes with different colors


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    

    
//    Triangle * view1 = [[Triangle alloc]initWithFrame:CGRectMake(40, 60, 300, 400)];
////    view.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:view1];
    
    
    [super viewDidLoad];
    
    Rectangle * view = [[Rectangle alloc]initWithFrame:CGRectMake(73,120,320,400)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    Triangle * view1 = [[Triangle alloc]initWithFrame:CGRectMake(95,20,160,160)];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    
    Ellipse * view2 = [[Ellipse alloc]initWithFrame:CGRectMake(20,60,SCREEN_WIDTH - 20,40)];
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    Rectangle * paint = [[Rectangle alloc] initWithFrame:self.view.bounds];
//    
//
//    
//    Triangle * paint1 = [[Triangle alloc] initWithFrame:self.view.bounds];
//    
//     [self.view addSubview:paint];
//    
//    [self.view addSubview:paint1];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
