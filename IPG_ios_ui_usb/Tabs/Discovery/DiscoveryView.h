//
//  DiscoveryView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 4/22/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "config.h"
#import "DiscChoiceView.h"
#import "DIscOrderVIew.h"
#import "CarlCheckoutView.h"
#import "CvsCheckOutView.h"
#import "ReceiptView.h"

@interface DiscoveryView : UIView<DiscChoiceViewDelegate, DIscOrderVIewDelegate, CarlCheckoutViewDelegate, ReceiptViewDelegate, CvsCheckOutViewDelegate>

// FirstPage
@property (strong, nonatomic) DiscChoiceView * choiceView;

// SecondPage
@property (strong, nonatomic) DIscOrderVIew * orderView;

// ThirdPage
@property (strong, nonatomic) CarlCheckoutView * carlCheckOutView;
@property (strong, nonatomic) CvsCheckOutView * cvsCheckOutView;

// FourthPage
@property (strong, nonatomic) ReceiptView * receiptView;


@end
