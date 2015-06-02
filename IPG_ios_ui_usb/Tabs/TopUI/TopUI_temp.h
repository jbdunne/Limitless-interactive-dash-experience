//
//  TopUI_temp.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"



@protocol TopUI_temp_Delegata

- (void) onTempSwitch:(BOOL) isOn :(BOOL) isLeft;

@end

@interface TopUI_temp : UIView


@property (strong, nonatomic) UIImageView * tempBG;
@property (strong, nonatomic) UIImageView * signBG;

@property (strong, nonatomic) UIButton * minusBtn;
@property (strong, nonatomic) UIButton * plusBtn;

@property (strong, nonatomic) UILabel * tempLabel;
@property (assign, nonatomic) NSInteger currTemp;
@property (assign, nonatomic) BOOL isLeft;

@property (assign, nonatomic) BOOL tempOn;

- (id) initWithFrame:(CGRect)frame isLeft:(BOOL) isLeft;

// delegate
@property (assign, nonatomic) id delegate;



@end
