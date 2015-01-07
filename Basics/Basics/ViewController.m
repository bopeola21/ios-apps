//
//  ViewController.m
//  Basics
//
//  Created by Jide Opeola on 1/5/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"

//Create 2 View Controllers

// View Controller 1
// - 2 buttons (one will clear textfields, one will log all textfields)
// - 3 textfields (username, email, password)
// - password field should look like one by hiding the text with dots (look in the right panel)
// - email field should use email keyboard (also in right panel)


// View Controller 2
// - 4 buttons with different color backgrounds
// all one method
// - each button changes the main view controller's background color

// Add contstaints
// Make the buttons on view controller 2 circles with no text


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



- (IBAction)buttonDelete:(id)sender {
    
    self.userName.text = @"";
    self.Email .text = @"";
    self.Password.text = @"";
    
}

- (IBAction)buttonNext:(id)sender {
    
    self.userName_text = self.userName.text;
    self.Email_text = self.Email.text;
    self.Password_text = self.Password.text;
    
    
    NSLog(@"\nUsername is %@ \nEmail is %@ \nPassword is %@", self.userName_text,self.Email_text,self.Password_text);
    
    
    
}
@end
