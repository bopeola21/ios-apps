//
//  ViewController.h
//  First App
//
//  Created by Jide Opeola on 1/5/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)bigButtonPressed:(id)sender;

@end

