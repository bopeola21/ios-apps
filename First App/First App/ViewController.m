//
//  ViewController.m
//  First App
//
//  Created by Jide Opeola on 1/5/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)bigButtonPressed:(id)sender {
    
    self.myLabel.text = self.myTextField.text;
    
}

@end