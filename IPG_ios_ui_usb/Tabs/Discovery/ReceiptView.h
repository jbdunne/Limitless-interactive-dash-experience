//
//  ReceiptView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/19/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
@protocol ReceiptViewDelegate <NSObject>

- (void) onPayConfirmed;

@end


@interface ReceiptView : UIView

@property (strong, nonatomic) UIImageView * logoImgView;
@property (strong, nonatomic) UIButton * confirmBtn;

@property (weak, nonatomic) id delegate;

- (void) loadCarl;
- (void) loadCvs;


@end
