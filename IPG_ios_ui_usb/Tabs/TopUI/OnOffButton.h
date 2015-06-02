//
//  OnOffButton.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnOffButton : UIButton

@property (strong, nonatomic) UIImage * onImg;
@property (strong, nonatomic) UIImage * offImg;

@property (assign, nonatomic) BOOL isOn;



- (instancetype)initWithFrame:(CGRect) frame OnImage:(UIImage*)onImg OffImage:(UIImage*) offImg;

@end
