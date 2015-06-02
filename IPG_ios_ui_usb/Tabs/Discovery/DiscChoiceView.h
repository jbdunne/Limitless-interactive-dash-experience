//
//  DiscChoiceView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"

@protocol DiscChoiceViewDelegate <NSObject>

- (void) onViewOrderMenu:(NSInteger)at;

@end

@interface DiscChoiceView : UIView


@property (strong, nonatomic) UILabel * nowLabel;
@property (strong, nonatomic) UIImageView * bgImageView;

@property (strong, nonatomic) UIButton * orderCarlBtn;
@property (strong, nonatomic) UIButton * orderCvsBtn;

@property (assign, nonatomic) id delegate;



@end
