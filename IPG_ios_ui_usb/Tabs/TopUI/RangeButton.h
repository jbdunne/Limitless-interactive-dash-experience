//
//  RangeButton.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RangeButton : UIButton

@property (strong, nonatomic) NSArray * onImages;
@property (strong, nonatomic) NSArray * offImages;

@property (assign, nonatomic) NSInteger at;
@property (assign, nonatomic) NSInteger total;

@property (strong, nonatomic) NSMutableArray * imgViewArray;

@property (assign, nonatomic) BOOL isOn;
@property (assign, nonatomic) BOOL isLeft;


- (instancetype)initWithFrame:(CGRect)frame withOnImages:(NSArray*)onImages withOffImages:(NSArray*) offImage;

- (void) onTempSwitch:(BOOL)isOn :(BOOL)isLeft;

@end
