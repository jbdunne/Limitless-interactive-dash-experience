//
//  DialView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "DialView.h"

@implementation DialView

- (instancetype) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        
        //CALLING
        _callingView = [[UIView alloc] initWithFrame:frame];
        
        _callingNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 78, SCREEN_WIDTH, 130)];
        [_callingNumberLabel setTextColor:TEMP_ON_COLOR];
        [_callingNumberLabel setTextAlignment:NSTextAlignmentCenter];
        
        _callingImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-294)/2, 200, 294, 294)];
        [_callingImageView setImage:[UIImage imageNamed:@"phone_outgoingcall_icon"]];
        
        _callingCancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_callingCancelBtn setFrame:CGRectMake((SCREEN_WIDTH-664)/2, 494+28, 664, 106)];
        [_callingCancelBtn setBackgroundImage:[UIImage imageNamed:@"phone_endcall"] forState:UIControlStateNormal];
        [_callingCancelBtn addTarget:self action:@selector(onCallCancelBtn) forControlEvents:UIControlEventTouchUpInside];

        [_callingView addSubview:_callingNumberLabel];
        [_callingView addSubview:_callingImageView];
        [_callingView addSubview:_callingCancelBtn];
        
        
        _dialLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 165, SCREEN_WIDTH, 72)];
        [_dialLabel setTextColor:TEMP_ON_COLOR];
        [_dialLabel setTextAlignment:NSTextAlignmentCenter];
        
        
        // add subview
        [self addSubview:_callingView];
        
    
    
    
    }
    return self;
}

- (void) setDialLabelString:(NSString*)dialNumber{
    _dialNumber = dialNumber;
    [_dialLabel setText:[NSString stringWithFormat:@"%@ is busy...",_dialNumber]];
    [_callingNumberLabel setText:dialNumber];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.f target:self selector:@selector(onDialViewTimeout) userInfo:nil repeats:NO];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
    
}


- (void) onCallCancelBtn{
    NSLog(@"[DialView] Call Canceled");
    [_timer invalidate];
    [self showCalling];
    [self.delegate onDialDone];
    
}


- (void) onDialViewTimeout{
    [self showBusy];
    _busyTimer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(onBusyTimerOut) userInfo:nil repeats:NO];
    
    [[NSRunLoop mainRunLoop] addTimer:_busyTimer forMode:NSRunLoopCommonModes];

    
}

- (void) onBusyTimerOut{
    [self.delegate onDialDone];
    [self showCalling];
}

- (void) showCalling{
    [_dialLabel removeFromSuperview];
    [self addSubview:_callingView];
}


- (void) showBusy{
    [_callingView removeFromSuperview];
    [self addSubview:_dialLabel];
}



@end

