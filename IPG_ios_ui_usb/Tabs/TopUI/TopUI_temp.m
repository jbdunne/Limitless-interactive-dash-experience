//
//  TopUI_temp.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "TopUI_temp.h"

@implementation TopUI_temp

- (id) initWithFrame:(CGRect)frame isLeft:(BOOL) isLeft{
    if( self = [super initWithFrame:frame]){
        
        // 0. Variables
        _currTemp = 77;
        _tempOn = true;
        _isLeft = isLeft;
        
        // 1. BG
        if (isLeft){
            _tempBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"climate_leftbutton_bg_on"]];
        }else{
            _tempBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"climate_rightbutton_bg_on"]];

        }
        
        
        [_tempBG setFrame:CGRectMake(0, 0, 263, 128)];
        [self addSubview:_tempBG];
        _signBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"climate_temp_f_on"]];
        [_signBG setFrame:CGRectMake(151, 53, 39, 30)];
        [self addSubview:_signBG];
        
        
        // 1. Btn
        _minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_minusBtn setFrame:CGRectMake(11, 43, 31, 31)];
        [_minusBtn setImage:[UIImage imageNamed:@"climate_temp_lower_on"] forState:UIControlStateNormal];
        [self addSubview:_minusBtn];
        
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusBtn setFrame:CGRectMake(213, 43, 31, 31)];
        [_plusBtn setImage:[UIImage imageNamed:@"climate_temp_higher_on"] forState:UIControlStateNormal];
        [self addSubview:_plusBtn];
        
        
        // 2. Temp Label
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 38, 80, 50)];
        [_tempLabel setTextColor:TEMP_ON_COLOR];
        [_tempLabel setText:[NSString stringWithFormat:@"%li",(long)_currTemp]];
        [_tempLabel setTextAlignment:NSTextAlignmentRight];
        [_tempLabel setFont:[UIFont systemFontOfSize:60]];
        [self addSubview:_tempLabel];
        
        
        
        // 3. interaction
        UITapGestureRecognizer * tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTempLabelTab)];
        [tapGest setNumberOfTapsRequired:1];
        
        [_tempLabel addGestureRecognizer:tapGest];
        [_tempLabel setUserInteractionEnabled:YES];
        
        [_minusBtn addTarget:self action:@selector(onMinusBtn) forControlEvents:UIControlEventTouchUpInside];
        [_plusBtn addTarget:self action:@selector(onPlusBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


- (void) onTempLabelTab{
    if( _tempOn ){
        _tempOn = false;
        [_minusBtn setImage:[UIImage imageNamed:@"climate_temp_lower_off"] forState:UIControlStateNormal];
        [_plusBtn setImage:[UIImage imageNamed:@"climate_temp_higher_off"] forState:UIControlStateNormal];
        [_tempLabel setTextColor:TEMP_OFF_COLOR];
        
        [_tempBG setImage:[UIImage imageNamed:@"climate_leftbutton_bg_off"]];
        [_signBG setImage:[UIImage imageNamed:@"climate_temp_f_off"]];

    }else{
        _tempOn = true;
        [_minusBtn setImage:[UIImage imageNamed:@"climate_temp_lower_on"] forState:UIControlStateNormal];
        [_plusBtn setImage:[UIImage imageNamed:@"climate_temp_higher_on"] forState:UIControlStateNormal];
        [_tempLabel setTextColor:TEMP_ON_COLOR];
        
        [_tempBG setImage:[UIImage imageNamed:@"climate_leftbutton_bg_on"]];
        [_signBG setImage:[UIImage imageNamed:@"climate_temp_f_on"]];
    }
    [self onTempSwitch:_tempOn :_isLeft];
}

- (void) onMinusBtn{
    if( _tempOn ){
        _currTemp--;
        [_tempLabel setText:[NSString stringWithFormat:@"%li",(long)_currTemp]];
    }
}

- (void) onPlusBtn{
    if( _tempOn){
        _currTemp++;
        [_tempLabel setText:[NSString stringWithFormat:@"%li",(long)_currTemp]];
    }
}

#pragma mark
#pragma mark - delegate
- (void) onTempSwitch:(BOOL) isOn :(BOOL) isLeft {
    [self.delegate onTempSwitch:isOn :isLeft];
}



@end
