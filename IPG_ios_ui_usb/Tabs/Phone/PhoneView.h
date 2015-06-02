//
//  PhoneView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeypadView.h"
#import "DialView.h"
#import "config.h"
@interface PhoneView : UIView<KeypadViewDelegate, DialViewDelegate>

@property (strong, nonatomic) KeypadView * keypadView;
@property (strong, nonatomic) DialView * dialView;
@property (strong, nonatomic) NSTimer * timer;



@end
