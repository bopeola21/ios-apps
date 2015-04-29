//
//  FriendDetailVC1.m
//  GitHubFriends
//
//  Created by Jide Opeola on 1/9/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "FriendDetailVC1.h"
#import "NewFriendVC.h"
#import "FriendsTVC.h"
#import "FriendCell.h"


@interface FriendDetailVC1 ()

//<UITableViewDelegate>

@end

@implementation FriendDetailVC1

{
    NSArray * repos;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString * username = self.friendInfo[@"login"];
//    
//    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/%@/repos", username];
//    
//    NSURL * url = [NSURL URLWithString:urlString];
//    
//    NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    
//    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
     [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"friendCell"];
    
  //  UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 368)];
    
//    tableView.delegate = self;
//    tableView.dataSource = self;
    
  //  [self.view addSubview:tableView];
    
    
    NSString * username = self.friendInfo[@"login"];
    
    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    
    
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];

    NSLog(@"%@",repos);
    
    
//    [self.view addSubview:tableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = repos[indexPath.row][@"name"];
    
    
    if (repos[indexPath.row][@"description"] == [NSNull null]) {
        
    } else {
        
        cell.detailTextLabel.text = repos[indexPath.row][@"description"];
        
    }
    
    
    
    // [ setTitle:@"Git User" forState:UIControlStateNormal];
    //  [saverFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Configure the cell...
    
    return cell;
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return repos.count;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//// #warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return repos.count;
}

//-(void)runRepo {
    
//    NewFriendVC * newFriendVC = [[NewFriendVC alloc] init];
    
//    FriendsTVC *friendsTVC = [[FriendsTVC alloc] init];
    
//    NSDictionary * friendI = friendInfo [indexPath.row];
    
    
    

//    
//    cell.textLabel.text = friendInfo[@"name"];
//    
//    
//    
//    
//    
//    
//    NSString * username = usernameField.text;
//    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@", username];
    
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
