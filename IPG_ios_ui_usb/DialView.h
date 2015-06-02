//
//  DialView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
@protocol DialViewDelegate
- (void) onDialDone;
@end


@interface DialView : UIView

// CALLING

@property (strong, nonatomic) UIView * callingView;
@property (strong, nonatomic) UILabel * callingNumberLabel;
@property (strong, nonatomic) UILabel * callingNameLabel;
@property (strong, nonatomic) UIImageView * callingImageView;
@property (strong, nonatomic) UIButton * callingCancelBtn;
@property (strong, nonatomic) NSTimer * timer;

// BUSY
@property (strong, nonatomic) UILabel * dialLabel;
@property (strong, nonatomic) NSTimer * busyTimer;

// called
@property (strong, nonatomic) NSString * dialNumber;
- (void) setDialLabelString:(NSString*)dialNumber;


// delegate
@property (assign, nonatomic) id delegate;

@end
