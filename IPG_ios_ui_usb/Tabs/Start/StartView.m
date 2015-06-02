//
//  StartView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/29/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "StartView.h"

@implementation StartView

- (id) initWithFrame:(CGRect)frame  {
    if ( self = [super initWithFrame:frame]){
        [self setBackgroundColor:BG_COLOR];
        
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setFrame:CGRectMake(SCREEN_WIDTH/2-112, SCREEN_HEIGHT/2-112, 224, 224)];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"start_pressed"] forState:UIControlStateHighlighted];
        [_startBtn addTarget:self action:@selector(onStartBtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_startBtn];
        
    }
    return self;
}

- (void) onStartBtn{
    [self removeFromSuperview];
}


@end
