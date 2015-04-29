//
//  AddFriendVC.m
//  The Crew
//
//  Created by Jide Opeola on 1/22/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.

// UI toolbar on a navigation controller..put it at the bottom of friends screen - dont need

// Table View Controller for when you click on a friend and pictures on different cells

#import "AddFriendVC.h"
#import "CrewMembersTableViewController.h"
#import <Parse/Parse.h>

@interface AddFriendVC ()

@end

@implementation AddFriendVC

{
    
    UITextField * usernameField;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 60, 300, 40)];
    
    usernameField.placeholder = @"Username";
    
    
    [self.view addSubview:usernameField];
    
    UIButton * saverFriend = [[UIButton alloc] initWithFrame:CGRectMake(10, 110, 300, 40)];
    
    [saverFriend setTitle:@"Add User" forState:UIControlStateNormal];
    [saverFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:saverFriend];
    
    UIButton * cancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 300, 40)];
    
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    [self.view addSubview:cancel];
    
    
    
}

-(void)save{
    

    PFObject * newFriend = [PFObject objectWithClassName:@"Friends"];
    
    newFriend[@"friendName"] = usernameField.text;
    
    [newFriend saveInBackground];
    
    
    [self cancel];
    
}

-(void)cancel {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
