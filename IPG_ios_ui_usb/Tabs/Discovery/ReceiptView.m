//
//  ReceiptView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/19/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "ReceiptView.h"

@implementation ReceiptView

- (instancetype)initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        _logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 261 -TOP_UI_GAP-TOP_UI_HEIGHT,SCREEN_WIDTH, 279)];
        
        
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setFrame:CGRectMake(304, 608-TOP_UI_HEIGHT-TOP_UI_GAP, 164, 164)];
        [_confirmBtn setBackgroundImage:[UIImage imageNamed:@"discovery_receipt_button"] forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(onConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_logoImgView];
        [self addSubview:_confirmBtn];
        
    }
    return self;
}


- (void)loadCarl{
    [_logoImgView setImage:[UIImage imageNamed:@"discovery_cjreceipt_info"]];
}

- (void) loadCvs{
    [_logoImgView setImage:[UIImage imageNamed:@"discovery_cvsreceipt_bg"]];
}

- (void) onConfirmBtn{
    NSDictionary * userInfo = [NSDictionary dictionaryWithObject:@"x4" forKey:@"IPAD_OUT"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IPAD_OUT" object:self userInfo:userInfo];
    [self.delegate onPayConfirmed];
}



@end
