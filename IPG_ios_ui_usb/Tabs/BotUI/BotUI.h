//
//  BotUI.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol BotUIDelegate

- (void) onNavigationFrom:(NSInteger)from to:(NSInteger)to;

@end



@interface BotUI : UIView

@property (strong, nonatomic) UIButton * homeBtn;
@property (strong, nonatomic) UIButton * discBtn;
@property (strong, nonatomic) UIButton * musicBtn;
@property (strong, nonatomic) UIButton * phoneBtn;

@property (assign, nonatomic) NSInteger at;


@property (assign, nonatomic) id delegate;

- (void) switchNavTo:(NSInteger) to;


@end
