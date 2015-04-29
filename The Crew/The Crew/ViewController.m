//
//  ViewController.m
//  The Crew
//
//  Created by Jide Opeola on 1/22/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "CrewMembersTableViewController.h"

IB_DESIGNABLE

@interface ViewController () <UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

{
    UITextField * usernameField;
    
    UITextField * passwordField;

    
    NSMutableArray * userCredential;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 240, 300, 40)];
    
    usernameField.placeholder = @"Username";
    
    
    [self.view addSubview:usernameField];
    
    
    passwordField.secureTextEntry = YES;
    
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(10, 290, 300, 40)];
    
    passwordField.placeholder = @"Password";
    
     [self.view addSubview:passwordField];
    
    
    
//    CGRect frame = CGRectMake(10, 290, 300, 3);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 290, 300, 40)];

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGRect rectangle = CGRectMake(10,250,236,1);
    
    CGContextAddRect(context, rectangle);
    
    CGContextStrokePath(context);
    [self.view addSubview:view];
//

    
}

- (IBAction)nextButton:(id)sender {
    
    self.text1 = usernameField.text;
    
    self.text2 = passwordField.text;
    
    PFUser * user = [PFUser user];
    
    user.username = self.text1;
    user.password = self.text2;
    
    [user signUpInBackground];
    
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
    

    

    
    CrewMembersTableViewController * crewMembersTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"crewMembersTVC"];
  
    [self.navigationController pushViewController:crewMembersTVC animated:YES];
    
    
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
