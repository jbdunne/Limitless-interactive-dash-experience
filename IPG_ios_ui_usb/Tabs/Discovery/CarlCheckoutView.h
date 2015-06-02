//
//  CarlCheckoutView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
#import "CheckOutTableViewCell.h"
#import "OrderItemData.h"

@protocol CarlCheckoutViewDelegate <NSObject>

- (void) onCarlPay;
- (void) onCarlMenu;
@end


@interface CarlCheckoutView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIImageView * logoImgView;
@property (strong, nonatomic) UILabel * countLabel;
@property (strong, nonatomic) UIImageView * countImgView;

@property (strong, nonatomic) UIImageView * lineTopImgView;
@property (strong, nonatomic) UIImageView * lineBotImgView;

@property (strong, nonatomic) UITableView * itemTableView;

@property (strong, nonatomic) UIImageView * TotalImgView;
@property (strong, nonatomic) UILabel * priceLabel;
@property (assign, nonatomic) CGFloat price;

@property (strong, nonatomic) UIButton * menuButton;
@property (strong, nonatomic) UIButton * payButton;


- (void) loadWithItems:(NSArray*) items;
@property (strong, nonatomic) NSArray * itemList;


@property (weak, nonatomic) id delegate;

@end
