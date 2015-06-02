//
//  KeypadView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"


@protocol KeypadViewDelegate <NSObject>

- (void) onDialedTo:(NSString *) number;

@end


@interface KeypadView : UIView




// fav buttons
@property (strong, nonatomic) UIButton * favBtn0;
@property (strong, nonatomic) UIButton * favBtn1;
@property (strong, nonatomic) UIButton * favBtn2;
@property (strong, nonatomic) NSArray * favNames;
@property (assign, nonatomic) BOOL isFav;

// Call Buttons
@property (strong, nonatomic) UILabel * keyTextField;
@property (strong, nonatomic) UIButton * deleteBtn;
@property (strong, nonatomic) UIButton * callBtn;
@property (strong, nonatomic) NSString * dialString;

// Key Pad
@property (strong, nonatomic) UIButton * key1;
@property (strong, nonatomic) UIButton * key2;
@property (strong, nonatomic) UIButton * key3;
@property (strong, nonatomic) UIButton * key4;
@property (strong, nonatomic) UIButton * key5;

@property (strong, nonatomic) UIButton * key6;
@property (strong, nonatomic) UIButton * key7;
@property (strong, nonatomic) UIButton * key8;
@property (strong, nonatomic) UIButton * key9;
@property (strong, nonatomic) UIButton * key0;

@property (strong, nonatomic) UIButton * keyStar;
@property (strong, nonatomic) UIButton * keySharp;


// delegate
@property (assign, nonatomic) id delegate;



@end
