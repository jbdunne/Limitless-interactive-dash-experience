//
//  TopUI.m
//  IPG_osx_ios
//
//  Created by Gene Han on 4/22/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "TopUI.h"

@implementation TopUI


- (id) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame] ){
        // self
        [self setBackgroundColor:[UIColor clearColor]];
        // Left/Right Temp
        _leftTempView = [[TopUI_temp alloc] initWithFrame:CGRectMake(0, 0, 263, 128) isLeft:YES];
        _leftTempView.delegate = self;
        
        _rightTempView = [[TopUI_temp alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 263, 0, 263, 128) isLeft:NO];
        _rightTempView.delegate = self;
        
        // Buttons
        // Left/Right Air Direction
        NSArray * airImageArray = @[[UIImage imageNamed:@"climate_settings_opt1"],
                                    [UIImage imageNamed:@"climate_settings_opt2"],
                                    [UIImage imageNamed:@"climate_settings_opt3"]];
        NSArray * airOffArray = @[[UIImage imageNamed:@"climate_settings_opt1_off"],
                                  [UIImage imageNamed:@"climate_settings_opt2_off"],
                                  [UIImage imageNamed:@"climate_settings_opt3_off"]];
        _leftAirBtn = [[StateButton alloc] initWithFrame:CGRectMake(30, 154, 55, 53) withImages:airImageArray andOffImages:airOffArray];
        _leftAirBtn.isLeft = true;
        
        _rightAirBtn = [[StateButton alloc] initWithFrame:CGRectMake(684, 154, 55, 53) withImages:airImageArray andOffImages:airOffArray];
        _rightAirBtn.isLeft = false;
        
        
        // Left/Right Air Strength
        NSArray * strOnImageArray = @[[UIImage imageNamed:@"climate_bar1_on"],
                                      [UIImage imageNamed:@"climate_bar2_on"],
                                      [UIImage imageNamed:@"climate_bar3_on"],
                                      [UIImage imageNamed:@"climate_bar4_on"],
                                      [UIImage imageNamed:@"climate_bar5_on"]];
        NSArray * strOffImageArray = @[[UIImage imageNamed:@"climate_bar1_off"],
                                       [UIImage imageNamed:@"climate_bar2_off"],
                                       [UIImage imageNamed:@"climate_bar3_off"],
                                       [UIImage imageNamed:@"climate_bar4_off"],
                                       [UIImage imageNamed:@"climate_bar5_off"]];
        _leftStrBtn = [[RangeButton alloc] initWithFrame:CGRectMake(111, 139, 125, 74)
                                            withOnImages:strOnImageArray
                                           withOffImages:strOffImageArray];
        _leftStrBtn.isLeft = true;
        
        _rightStrBtn = [[RangeButton alloc] initWithFrame:CGRectMake(534, 139, 125, 74)
                                             withOnImages:strOnImageArray
                                            withOffImages:strOffImageArray];
        _rightStrBtn.isLeft = false;
        
        
        // Switch
        _frostBtn = [[OnOffButton alloc] initWithFrame:CGRectMake(281, 166, 41, 41)
                                               OnImage:[UIImage imageNamed:@"climate_ac_on"]
                                              OffImage:[UIImage imageNamed:@"climate_ac_off"]];
        
        _flowBtn = [[OnOffButton alloc] initWithFrame:CGRectMake(349, 166, 57, 41)
                                              OnImage:[UIImage imageNamed:@"climate_circulate_on"]
                                             OffImage:[UIImage imageNamed:@"climate_circulate_off"]];
        
        _smogBtn = [[OnOffButton alloc] initWithFrame:CGRectMake(434, 166, 48, 41)
                                              OnImage:[UIImage imageNamed:@"climate_defrost_on"]
                                             OffImage:[UIImage imageNamed:@"climate_defrost_off"]];
        
        
        
        // SUB VIEWS
        [self addSubview:_leftTempView];
        [self addSubview:_rightTempView];
        
        
        //
        [self addSubview:_leftAirBtn];
        [self addSubview:_rightAirBtn];
        
        [self addSubview:_leftStrBtn];
        [self addSubview:_rightStrBtn];
        
        [self addSubview:_frostBtn];
        [self addSubview:_flowBtn];
        [self addSubview:_smogBtn];
    
    }
    return self;
}

#pragma mark
#pragma mark - delegate
- (void) onTempSwitch:(BOOL)isOn :(BOOL)isLeft{
    if( isLeft ){
        [_leftAirBtn onTempSwitch:isOn :isLeft];
        [_leftStrBtn onTempSwitch:isOn :isLeft];
    }else{
        [_rightAirBtn onTempSwitch:isOn:isLeft];
        [_rightStrBtn onTempSwitch:isOn :isLeft];
    }
}



@end
