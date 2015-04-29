//
//  FriendDetailVC.m
//  GitHubFriends
//
//  Created by Jide Opeola on 1/8/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "FriendDetailVC.h"
#import "NewFriendVC.h"


// Add property to this class .h called "friendInfo"

// Grab the request code from NewFriendVC.m

// Change the url to https://api.github.com/users/USERNAME/repos
// make USERNAME dynamic based on friendInfo[@"login"]

// the return will be an NSArray of repos

// log the repos array

// Extra

// make selecting a cell push to FriendDetailVC
// and set friendInfo based on cell selected


@interface FriendDetailVC ()

@end

@implementation FriendDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
//    [cell setTitle:@"Git User" forState:UIControlStateNormal];
//    [saverFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userRepo{
    
//    NewFriendVC * newFriendVC = [[NewFriendVC alloc] init];
    
  //  NSMutableArray * user = newFriendVC.friends;
    
//    cell.textLabel.text = friendInfo[@"name"];
//  
//    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/%@/repos", username];
//    
//    NSURL * url = [NSURL URLWithString:urlString];
//    
//    NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    
//    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
//    
//    [self.friends addObject:userInfo];
//    
    
    
    
    
    
    
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 
    
    
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
