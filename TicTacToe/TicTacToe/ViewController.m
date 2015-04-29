//
//  ViewController.m
//  TicTacToe
//
//  Created by Jide Opeola on 1/12/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import "CircleButton.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// Center Square on View
// Score label on top that keeps track of wins for each player (global instance variable)
// Make buttons change color instead of title (reset colors when play again)
// Button at bottom that resets game scores

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController
{
    
    int playerTurn;
    int player1;
    int player2;
    int playerWon;
    
    
    NSMutableArray * squares;
    NSMutableArray * buttons;
    
    UILabel * winsField1;
    
    UILabel * winsField2;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    buttons = [@[] mutableCopy];
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0
                 ] mutableCopy];
    
    int rowCount = 3;
    int colCount = 3;
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    int buttonCount = 0;
    
    winsField1 = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 320) / 2, 30, 300, 40)];
    
    winsField2 = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 320) / 2, 50, 300, 40)];
    
                winsField1.text = [NSString stringWithFormat:@"Player 1: 0 wins"];
                winsField2.text = [NSString stringWithFormat:@"Player 2: 0 wins"];
    
    
    [self.view addSubview:winsField1];
    [self.view addSubview:winsField2];
    
    for (int r = 0; r < rowCount; r++) {
        
        // loop per row
        
        for (int c = 0; c < colCount; c++) {
            
            // loop per colum
            
            CGFloat x = c * (width + 10) + (SCREEN_WIDTH - 320) / 2;
            CGFloat y = r * (height + 10) + (SCREEN_HEIGHT - 320) / 2;
            
            CircleButton * button = [[CircleButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor = [UIColor blueColor];
//          [button setTitle:[NSString stringWithFormat:@"%d",buttonCount] forState:UIControlStateNormal];
            button.tag = buttonCount;
            
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - width)/2, SCREEN_HEIGHT-80, width, 50)];
            
           
            
            resetButton.backgroundColor = [UIColor redColor];
            
            [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
            
            
            [self.view addSubview:resetButton];
            
            [self.view addSubview:button];
            
            [buttons addObject:button];
            
            [resetButton setTitle:[NSString stringWithFormat:@"RESET"] forState:UIControlStateNormal];
            
            buttonCount++;
            
        }
    }
    
 //   NSLog(@"subview count %@",self.view.subviews);
}

-(void)squareTapped:(UIButton *)button {
    
    if ([squares[button.tag] intValue] != 0) { return; }
    
    squares[button.tag] = @(playerTurn);
    
  //  [button setTitle:[NSString stringWithFormat:@"%d", playerTurn] forState:UIControlStateNormal];
    
//    button.backgroundColor = [UIColor redColor];
    
    playerTurn = (playerTurn ==2) ? 1 : 2;
    
    // "?" means "then"..... ":" means "else"
    
    if (playerTurn == 1) {
        button.backgroundColor = [UIColor redColor];
        [button setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
      
    }
    
    if (playerTurn == 2) {
        button.backgroundColor = [UIColor blackColor];
        [button setTitle:[NSString stringWithFormat:@"O"] forState:UIControlStateNormal];
    }
    
    // "?" = then..... ":" = else
    
    [self checkForWin];
    
    if (playerWon != 1 ) {
        [self checkForTie];
    }
    
    
    
 //   NSLog(@"button tapped %d",(int)button.tag);
    
}

-(void)checkForTie {
    
    
    if (![squares containsObject:@0]) {
  //      NSLog(@"Tie Game");
        
        NSString * message = [NSString stringWithFormat:@"Tied Game"];
        
        UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"No Winner" message:message delegate:self cancelButtonTitle:@"Play Again Now!" otherButtonTitles:nil];
        
        [alertView1 show];
    
    }
}






-(void)checkForWin {
    
    NSArray * possibilities = @[
                                // rows
                                @[@0,@1,@2],
                                @[@3,@4,@5],
                                @[@6,@7,@8],
                                
                                // columns
                                @[@0,@3,@6],
                                @[@1,@4,@7],
                                @[@2,@5,@8],
                                
                                // diagnols
                                @[@0,@4,@8],
                                @[@2,@4,@6]
                                
                                ];
    
 //   NSLog(@"Player %@ Won",squares);
    

    
    for (NSArray *possibility in possibilities) {
        
        [self checkPossibility:possibility withPlayer:1];
        [self checkPossibility:possibility withPlayer:2];
        
        }
        
    }


-(void)checkPossibility:(NSArray *)possibility withPlayer:(int)player {
    
    BOOL playerInSquare1 = ([squares[[possibility[0] intValue]] intValue] == player);
    BOOL playerInSquare2 = ([squares[[possibility[1] intValue]] intValue] == player);
    BOOL playerInSquare3 = ([squares[[possibility[2] intValue]] intValue] == player);
    
    
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        
        if (player ==1) {
            player1++;
            
            winsField1.text = [NSString stringWithFormat:@"Player 1: %d wins", player1];
            winsField2.text = [NSString stringWithFormat:@"Player 2: %d wins", player2];
           
        }
        
        if (player ==2) {
            player2++;
            
            winsField2.text = [NSString stringWithFormat:@"Player 2: %d wins", player2];
            winsField1.text = [NSString stringWithFormat:@"Player 1: %d wins", player1];
            
        }
        
        NSLog(@"Squares 0 %d, Squares 1 %d, Squares 2 %d",[squares[[possibility[0] intValue]] intValue],[squares[[possibility[1] intValue]] intValue],[squares[[possibility[1] intValue]] intValue]);
        
        playerWon = 1;
        
        
        
        //player 1 won
   //     NSLog(@"Player %d Won",player);
        
        NSString * message = [NSString stringWithFormat:@"Player %d Won",player];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:message delegate:self cancelButtonTitle:@"Play Again Now!" otherButtonTitles:nil];
        
        [alertView show];
    }
    
}

-(void)reset {

    for (UIButton *button in buttons) {
        
        [button setTitle:@"" forState:UIControlStateNormal];
        
        button.backgroundColor = [UIColor blueColor];
        
    }
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0
                 ] mutableCopy];
    
    
    
 //   NSLog(@"Play Again");
    player1 = 0;
    
    player2 = 0;
    
    playerWon = 0;
    
    winsField1.text = [NSString stringWithFormat:@"Player 1: 0 wins"];
    winsField2.text = [NSString stringWithFormat:@"Player 2: 0 wins"];

}

-(void)alertView1:(UIAlertView *)alertView1 clickedButtonAtIndex:(NSInteger)buttonIndex {

    

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // square titles
    // playerTurn = 1
    // reset arrary
    
    for (UIButton *button in buttons) {
        
        [button setTitle:@"" forState:UIControlStateNormal];
        
        button.backgroundColor = [UIColor blueColor];
        
    }
    
    playerTurn = 1;
    
    squares = [@[
                 @0,@0,@0,
                 @0,@0,@0,
                 @0,@0,@0
                 ] mutableCopy];
    
    playerWon = 0;
    
 //   NSLog(@"Play Again");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
