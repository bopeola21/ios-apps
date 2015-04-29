//
//  FriendsTVC.m
//  GitHubFriends
//
//  Created by Jide Opeola on 1/8/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "FriendsTVC.h"
#import "FriendCell.h"
#import "NewFriendVC.h"
#import "FriendDetailVC1.h"



@interface FriendsTVC ()

@end

@implementation FriendsTVC

{
    NSMutableArray * friends;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    friends = [@[
                 
                 @{
                
                 @"login":@"bopeola21",
                 @"id": @10440984,
                 @"avatar_url": @"https://avatars.githubusercontent.com/u/10440984?v=3",
                 @"name": @"Jide Opeola",
                 @"company": @"The Iron Yard",
                 @"blog": @"jo2.co",
                 @"location": @"Atlanta, Ga",
                 @"email": @"b.opeola21@gmail.com",
                 @"public_repos": @25,
                 @"public_gists": @6,
                 @"followers": @39,
                 @"following": @48,
                 }
               
                 ] mutableCopy];
    
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"friendCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem * addFriendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
    
    self.navigationItem.rightBarButtonItem = addFriendButton;
    
   
    

    
    
    
    
    
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  //  [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
    FriendDetailVC1 * detailVC = [[FriendDetailVC1 alloc]init];
    
    detailVC.friendInfo = friends[indexPath.row];
    
    
//    [self addRepo];
    
    detailVC.view.backgroundColor = [UIColor whiteColor];

    
    [[self navigationController] pushViewController:detailVC animated:YES];
    
}


-(void)addFriend {
    
    //add friend to array
    
    UINavigationController *nC = [[UINavigationController alloc] init];
    
    NewFriendVC * newFriendVC = [[NewFriendVC alloc] init];
    
    newFriendVC.view.backgroundColor = [UIColor purpleColor];
    
    
    newFriendVC.friends = friends;
    
    nC.viewControllers = @[newFriendVC];
    
    [self presentViewController:nC animated:YES completion:nil];
    
    
    
}


//-(void)addRepo {
//    
//    //add friend to array
//    
////    UITableViewController *rP = [[UITableViewController alloc] init];
//    
//    FriendDetailVC1 * friendDetailVC1 = [[FriendDetailVC1 alloc] init];
//    
//    friendDetailVC1.view.backgroundColor = [UIColor whiteColor];
//    
////      friendDetailVC1.friendInfo = friends;
//    
//    
//    
//    
////
////    rP.viewControllers = @[friendDetailVC];
//    
////    [self presentViewController:rP animated:YES completion:nil];
//    
//     [[self navigationController] pushViewController:friendDetailVC1 animated:YES];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    NSDictionary * friendInfo = friends [indexPath.row];
    
    cell.textLabel.text = friendInfo[@"name"];
    
    NSURL * avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    
    NSData * imageData = [NSData dataWithContentsOfURL:avatarURL];
    
    UIImage * image = [UIImage imageWithData:imageData];
    
    cell.imageView.image = image;
    
    
    
    
   // [ setTitle:@"Git User" forState:UIControlStateNormal];
  //  [saverFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Configure the cell...
    
    return cell;
}


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
