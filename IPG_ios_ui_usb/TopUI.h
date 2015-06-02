//
//  TopUI.h
//  IPG_osx_ios
//
//  Created by Gene Han on 4/22/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "config.h"
#import "TopUI_temp.h"
#import "OnOffButton.h"
#import "StateButton.h"
#import "RangeButton.h"

@interface TopUI : UIView<TopUI_temp_Delegata>

// LEFT TEMP
@property (strong, nonatomic) TopUI_temp * leftTempView;
@property (strong, nonatomic) TopUI_temp * rightTempView;

// state Buttons
@property (strong, nonatomic) StateButton * leftAirBtn;
@property (strong, nonatomic) StateButton * rightAirBtn;

// range buttons
@property (strong, nonatomic) RangeButton * leftStrBtn;
@property (strong, nonatomic) RangeButton * rightStrBtn;

// on/off buttons
@property (strong, nonatomic) OnOffButton * frostBtn;
@property (strong, nonatomic) OnOffButton * flowBtn;
@property (strong, nonatomic) OnOffButton * smogBtn;



@end
