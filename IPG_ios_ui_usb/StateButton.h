//
//  StateButton.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StateButton : UIButton

@property (strong, nonatomic) NSArray * imageArray;
@property (strong, nonatomic) NSArray * offArray;
@property (assign, nonatomic) NSInteger at;
@property (assign, nonatomic) NSInteger total;
@property (assign, nonatomic) BOOL isOn;
@property (assign, nonatomic) BOOL isLeft;


- (instancetype) initWithFrame:(CGRect)frame withImages:(NSArray*)imageArray andOffImages:(NSArray*) offArray;
- (void) onTempSwitch:(BOOL)isOn :(BOOL)isLeft;


@end
