//
//  NotiView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/29/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "NotiView.h"

@implementation NotiView

- (instancetype) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor greenColor]];
        
        _notiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 50)];
        _notiStr = @"NOTIFICATION";
        [_notiLabel setText:_notiStr];
        [_notiLabel setTextColor:TEMP_ON_COLOR];
        [_notiLabel setTextAlignment:NSTextAlignmentCenter];
        
        _yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_yesBtn setFrame:CGRectMake(40, 80, 100, 100)];
        [_yesBtn setTitle:@"YES" forState:UIControlStateNormal];
        [_yesBtn setBackgroundColor:[UIColor redColor]];
        [_yesBtn setTag:1];
        [_yesBtn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _noBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_noBtn setFrame:CGRectMake(600, 80, 100,100)];
        [_noBtn setTitle:@"NO" forState:UIControlStateNormal];
        [_noBtn setBackgroundColor:[UIColor blueColor]];
        [_noBtn setTag:0];
        [_noBtn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_notiLabel];
        [self addSubview:_yesBtn];
        [self addSubview:_noBtn];
        
    }
    return self;
}


- (void) onBtn:(id)sender{
    [self hideNoti];
}


- (void) showNoti{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3f];
    [UIView  setAnimationDelegate:self];
    [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOP_UI_HEIGHT)];
    [UIView commitAnimations];
}

- (void) hideNoti{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3f];
    [UIView  setAnimationDelegate:self];
    [self setFrame:CGRectMake(0, -TOP_UI_HEIGHT, SCREEN_WIDTH, TOP_UI_HEIGHT)];
    [UIView commitAnimations];
}

- (void) setNotiText:(NSString*) text{

}


@end
