//
//  PhoneView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "PhoneView.h"

@implementation PhoneView


- (id) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        _keypadView = [[KeypadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _keypadView.delegate = self;
        _dialView = [[DialView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _dialView.delegate = self;
        [self addSubview:_keypadView];
    }
    return self;
}


// KEY PAD DELEGAET
- (void) onDialedTo:(NSString *)number{
    NSLog(@"[PhoneView] dialed to :%@", number);
    [_dialView setDialLabelString:number];
    
    [_keypadView removeFromSuperview];
    [self addSubview:_dialView];
    

}
// DIAL VIEW DELEGATE

- (void) onDialDone{
    [_dialView removeFromSuperview];
    [self addSubview:_keypadView];
}


@end
