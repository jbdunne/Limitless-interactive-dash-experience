//
//  DiscChoiceView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "DiscChoiceView.h"

@implementation DiscChoiceView


- (instancetype)initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 262 - TOP_UI_GAP - TOP_UI_HEIGHT, SCREEN_WIDTH, 620)];
        [_bgImageView setImage:[UIImage imageNamed:@"discovery_main_bg"]];
        
        _orderCarlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderCarlBtn setFrame:CGRectMake(13, 611-TOP_UI_HEIGHT-TOP_UI_GAP, 359, 50)];
        [_orderCarlBtn setBackgroundImage:[UIImage imageNamed:@"discovery_main_button"] forState:UIControlStateNormal];
        [_orderCarlBtn setBackgroundImage:[UIImage imageNamed:@"discovery_main_button_pressed"] forState:UIControlStateHighlighted];
        [_orderCarlBtn addTarget:self action:@selector(onOrderCarlBtn) forControlEvents:UIControlEventTouchUpInside];
        
        _orderCvsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderCvsBtn setFrame:CGRectMake(396, 611-TOP_UI_HEIGHT-TOP_UI_GAP, 359, 50)];
        [_orderCvsBtn setBackgroundImage:[UIImage imageNamed:@"discovery_main_button"] forState:UIControlStateNormal];
        [_orderCvsBtn setBackgroundImage:[UIImage imageNamed:@"discovery_main_button_pressed"] forState:UIControlStateHighlighted];
        [_orderCvsBtn addTarget:self action:@selector(onOrderCvsBtn) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_bgImageView];
        [self addSubview:_orderCvsBtn];
        [self addSubview:_orderCarlBtn];
        
    }
    return self;
}


- (void) onOrderCarlBtn{
    
    NSDictionary * userInfo = [NSDictionary dictionaryWithObject:@"x2" forKey:@"IPAD_OUT"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IPAD_OUT" object:self userInfo:userInfo];
    NSLog(@"[DiscChoiceView] on Carl order");
    [self.delegate onViewOrderMenu:0];
}

- (void) onOrderCvsBtn{
    NSDictionary * userInfo = [NSDictionary dictionaryWithObject:@"x3" forKey:@"IPAD_OUT"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IPAD_OUT" object:self userInfo:userInfo];
    NSLog(@"[DiscChoiceView] on CVS order");
    [self.delegate onViewOrderMenu:1];
}



@end
