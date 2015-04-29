//
//  ViewController.m
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/14/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"
IB_DESIGNABLE

// fill path, fill color
// round the join and the cap
// stroke join stroke cap

@interface ViewController ()

@end

@implementation ViewController

{
    
    NSMutableDictionary * currentScribble;
    UIColor * selectedColor;
    int selectedStrokeWidth;
    BOOL fillornah;
    int segmenthits;
    int selectedAlpha;
    ScribbleView * sView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    selectedColor = [UIColor blackColor];
    

}


- (IBAction)changeColor:(UIButton *)sender {
    
    selectedColor = sender.backgroundColor;
    
    fillornah = NO;
    
    sender.alpha = 1;
    
    
    
 //    NSLog(@"segment = %@",_segment.selectedSegmentIndex);
    
    
//    if (_momentary.selectedSegmentIndex == 1) {
//        selectedColor = sender.backgroundColor;
//        fillornah = YES;
//        
//        NSLog(@"segment = %@",_momentary);
//        
//    }
    
//    } else {
//        selectedColor = sender.backgroundColor;
//        
//        fillornah = NO;
//        
//        NSLog(@"segment = %@",_momentary);
//    }
    
    
    
    
}


- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
    
    
    
    
    
    
}

- (IBAction)fillColor:(UIButton *)sender {
    
    
    selectedColor = sender.backgroundColor;
    fillornah = YES;
    
    sender.alpha = 1;
    
    
}

- (IBAction)fillColor1:(UISegmentedControl *)sender {
    
  //  segmenthits = sender;
    
   
    NSLog(@"%d",sender.selectedSegmentIndex);
    
}

- (IBAction)alphaValue:(UISlider *)sender {
    
    selectedAlpha = sender.value;
    
}

- (IBAction)scribblesClear:(UIButton *)sender {
    
    
    [sView.scribbles removeAllObjects];
    
    [self.view setNeedsDisplay];
}

- (IBAction)scribbleUndo:(UIButton *)sender {
    

    [sView.scribbles removeObjectIdenticalTo:currentScribble];
    
    currentScribble = sView.scribbles.lastObject;
    
    [self.view setNeedsDisplay];
    
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    
    currentScribble = [@{
                         
                         @"fill":@(fillornah),
                         @"type":@"path",
                         @"fillColor":[UIColor clearColor],
                         @"strokeColor":selectedColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                         @"alpha":@(selectedAlpha),
                         @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                         
                         } mutableCopy];
                         
                         
    sView = (ScribbleView *)self.view;
    
    
    [sView.scribbles addObject:currentScribble];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
    
}


@end
