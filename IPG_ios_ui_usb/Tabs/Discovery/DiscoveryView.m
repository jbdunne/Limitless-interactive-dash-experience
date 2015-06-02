//
//  DiscoveryView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 4/22/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "DiscoveryView.h"

@implementation DiscoveryView


- (instancetype) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
    
        _choiceView = [[DiscChoiceView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _choiceView.delegate = self;
        
        _orderView = [[DIscOrderVIew alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _orderView.delegate = self;
        
        _carlCheckOutView = [[CarlCheckoutView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _carlCheckOutView.delegate = self;
        _cvsCheckOutView = [[CvsCheckOutView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _cvsCheckOutView.delegate = self;
        
        _receiptView = [[ReceiptView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
        _receiptView.delegate = self;
        
        [self addSubview:_choiceView];
    }
    return  self;
}

// CHOICE DELEGATE
- (void)onViewOrderMenu:(NSInteger)at{
    [_orderView loadOrderAt:at];
    [_choiceView removeFromSuperview];
    [self addSubview:_orderView];
}

// ORDER DELEGATE
- (void) onOrderWithItems:(NSArray *)items isCarl:(BOOL)isCarl{
    [_orderView removeFromSuperview];
    if( isCarl){
        [_carlCheckOutView loadWithItems:items];
        [self addSubview:_carlCheckOutView];
    }else{
        [_cvsCheckOutView loadWithItems:items];
        [self addSubview:_cvsCheckOutView];
    }
}

// CHECKOUT DELEGATE
- (void)onCarlPay{
    [_carlCheckOutView removeFromSuperview];
    [_receiptView loadCarl];
    [self addSubview:_receiptView];
}

- (void) onCarlMenu{
    [_orderView loadOrderAt:0];
    [_carlCheckOutView removeFromSuperview];
    [self addSubview:_orderView];
}

- (void) onCvsPay{
    [_cvsCheckOutView removeFromSuperview];
    [_receiptView loadCvs];
    [self addSubview:_receiptView];
}

- (void) onCvsMenu{
    [_orderView loadOrderAt:1];
    [_cvsCheckOutView removeFromSuperview];
    [self addSubview:_orderView];
}


// RECEIPT DELEGATE
- (void) onPayConfirmed{
    [_receiptView removeFromSuperview];
    [self addSubview:_choiceView];
}


@end
