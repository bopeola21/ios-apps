//
//  Body.h
//  Human
//
//  Created by Jide Opeola on 1/6/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Legs;
@class Head;
@class Arm;


@interface Body : NSObject
@property (nonatomic) Legs * legs;
@property (nonatomic) Head * head;
@property (nonatomic) Arm * arm;

@end
