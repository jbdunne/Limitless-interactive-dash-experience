//
//  NotiView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/29/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
@interface NotiView : UIView

@property (nonatomic, strong) UILabel * notiLabel;
@property (nonatomic, strong) NSString * notiStr;
@property (nonatomic, strong) UIButton * yesBtn;
@property (nonatomic, strong) UIButton * noBtn;


- (void) showNoti;
- (void) hideNoti;
- (void) setNotiText:(NSString*) text;


@end
