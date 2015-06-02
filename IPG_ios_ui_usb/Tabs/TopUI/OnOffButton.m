//
//  OnOffButton.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "OnOffButton.h"

@implementation OnOffButton


- (instancetype)initWithFrame:(CGRect) frame OnImage:(UIImage*)onImg OffImage:(UIImage*) offImg{
    if( self = [super initWithFrame:frame]){
        _onImg = onImg;
        _offImg = offImg;
        _isOn = false;
        
        [self setImage:_offImg forState:UIControlStateNormal];
        
        [self addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void) onClick{
    if( _isOn ){
        _isOn = false;
        [self setImage:_offImg forState:UIControlStateNormal];
    }else{
        _isOn = true;
        [self setImage:_onImg forState:UIControlStateNormal];
    }
}






@end
