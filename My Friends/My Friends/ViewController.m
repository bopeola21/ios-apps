//
//  ViewController.m
//  My Friends
//
//  Created by Jide Opeola on 1/22/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    
}

- (IBAction)nextButton:(id)sender {
    
    self.text1 = self.usernameTextField.text;
    
    self.text2 = self.passwordTextField.text;
    
    [PFUser currentUser].username = self.text1;
    [PFUser currentUser].password = self.text2;
    
    [[PFUser currentUser] saveInBackground];
    
    
    // "Item" creates folder in Parse
    PFObject * currentUser = [PFObject objectWithClassName:@"User"];
    
    currentUser[@"username"] = [PFUser currentUser].username;
    
    // PF user is a subclass
    currentUser[@"password"] = [PFUser currentUser].password;
    
    [currentUser saveInBackground];
    
    
}

- (IBAction)cancelButton:(id)sender {
    
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
