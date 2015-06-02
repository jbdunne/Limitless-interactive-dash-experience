//
//  BotUI.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "BotUI.h"

@implementation BotUI


- (instancetype) initWithFrame:(CGRect)frame{

    if( self = [super initWithFrame:frame]){
        _at = 0;
        
        _homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_homeBtn setFrame:CGRectMake(18, 0, 155, 109)];
        [_homeBtn setImage:[UIImage imageNamed:@"nav_home_on"] forState:UIControlStateNormal];
        [_homeBtn setTag:0];
        [_homeBtn addTarget:self action:@selector(onClickAt:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _discBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_discBtn setFrame:CGRectMake(214, 0, 155, 109)];
        [_discBtn setImage:[UIImage imageNamed:@"nav_map_off"] forState:UIControlStateNormal];
        [_discBtn setTag:1];
        [_discBtn addTarget:self action:@selector(onClickAt:) forControlEvents:UIControlEventTouchUpInside];
        
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_musicBtn setFrame:CGRectMake(407, 0, 155, 109)];
        [_musicBtn setImage:[UIImage imageNamed:@"nav_music_off"] forState:UIControlStateNormal];
        [_musicBtn setTag:2];
        [_musicBtn addTarget:self action:@selector(onClickAt:) forControlEvents:UIControlEventTouchUpInside];
        
        _phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_phoneBtn setFrame:CGRectMake(598, 0, 155, 109)];
        [_phoneBtn setImage:[UIImage imageNamed:@"nav_phone_off"] forState:UIControlStateNormal];
        [_phoneBtn setTag:3];
        [_phoneBtn addTarget:self action:@selector(onClickAt:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_homeBtn];
        [self addSubview:_discBtn];
        [self addSubview:_musicBtn];
        [self addSubview:_phoneBtn];
    }
    return self;
}

- (void) onClickAt:(UIButton*) btn{
    [self offBtnAt:_at];
    [self onBtnAt:btn.tag];
    [_delegate onNavigationFrom:_at to:btn.tag];
    _at = btn.tag;

}

- (void) offBtnAt:(NSInteger) at{
    switch (at) {
        case 0:
            [_homeBtn setImage:[UIImage imageNamed:@"nav_home_off"] forState:UIControlStateNormal];
            break;
        case 1:
            [_discBtn setImage:[UIImage imageNamed:@"nav_map_off"] forState:UIControlStateNormal];
            break;
        case 2:
            [_musicBtn setImage:[UIImage imageNamed:@"nav_music_off"] forState:UIControlStateNormal];
            break;
        case 3:
            [_phoneBtn setImage:[UIImage imageNamed:@"nav_phone_off"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
}

- (void) onBtnAt:(NSInteger) at{
    switch (at) {
        case 0:
            [_homeBtn setImage:[UIImage imageNamed:@"nav_home_on"] forState:UIControlStateNormal];
            break;
        case 1:
            [_discBtn setImage:[UIImage imageNamed:@"nav_map_on"] forState:UIControlStateNormal];
            break;
        case 2:
            [_musicBtn setImage:[UIImage imageNamed:@"nav_music_on"] forState:UIControlStateNormal];
            break;
        case 3:
            [_phoneBtn setImage:[UIImage imageNamed:@"nav_phone_on"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}


- (void) switchNavTo:(NSInteger) to{
    [self offBtnAt:_at];
    [self onBtnAt:to];
    [_delegate onNavigationFrom:_at to:to];
    _at = to;
}


@end
