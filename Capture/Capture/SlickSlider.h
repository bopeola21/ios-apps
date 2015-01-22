//
//  SlickSlider.h
//  Capture
//
//  Created by Jide Opeola on 1/21/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlickSliderDelegate;


IB_DESIGNABLE
@interface SlickSlider : UIView

@property (nonatomic) IBInspectable float startPosition;
// @property (nonatomic) IBInspectable UIColor * sliderColor;

@property (nonatomic, assign) id <SlickSliderDelegate> delegate;

// delegate is listeningObject, it's the person that is listening

@property (nonatomic) IBInspectable BOOL reverseColor;

@end

@protocol SlickSliderDelegate <NSObject>

-(void)sliderDidFinishUpdatingWithValue:(float)value;



@end
