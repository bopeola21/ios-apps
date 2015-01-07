//
//  ViewController.h
//  Basics
//
//  Created by Jide Opeola on 1/5/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *Email;

@property (weak, nonatomic) IBOutlet UITextField *Password;

@property (nonatomic) NSString * userName_text;
@property (nonatomic) NSString * Email_text;
@property (nonatomic) NSString * Password_text;



//view controller 2



- (IBAction)buttonDelete:(id)sender;

- (IBAction)buttonNext:(id)sender;



@end