//
//  HomeView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView

- (instancetype) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        UIImageView * outsideImg = [[UIImageView alloc] initWithFrame:CGRectMake(238, 461-MID_VIEW_Y, 240, 18)];
        [outsideImg setImage:[UIImage imageNamed:@"outside_temperature_text"]];
        [self addSubview:outsideImg];
        
        UIImageView * outsideUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(414, 529-MID_VIEW_Y, 129, 109)];
        [outsideUnitImg setImage:[UIImage imageNamed:@"outsude_temperature_f"]];
        [self addSubview:outsideUnitImg];
        
        UILabel * tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(238, 480-MID_VIEW_Y, 200, 200)];
        [tempLabel setText:@"74"];
        [tempLabel setTextColor:TEMP_ON_COLOR];
        [tempLabel setFont:[UIFont systemFontOfSize:150]];
        [tempLabel setUserInteractionEnabled:YES];
        
        [self addSubview:tempLabel];
        
        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        
        [tempLabel addGestureRecognizer:longPress];

    }
    return self;

}

-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
        NSDictionary * userInfo = [NSDictionary dictionaryWithObject:@"x1" forKey:@"IPAD_OUT"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IPAD_OUT" object:self userInfo:userInfo];
    }

}

- (void) onLongPress{
    

}

@end
