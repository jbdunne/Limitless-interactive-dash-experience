//
//  StateButton.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "StateButton.h"

@implementation StateButton


- (instancetype) initWithFrame:(CGRect)frame withImages:(NSArray*)imageArray andOffImages:(NSArray*) offArray{
    if( self = [super initWithFrame:frame]){
        _imageArray = imageArray;
        _offArray = offArray;
        _at = 0;
        _total = [_imageArray count];
        [self setImage:(UIImage*)[_imageArray objectAtIndex:0] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
        _isOn = true;
    }
    return self;
}


- (void) onClick{
    if( _isOn ){
        _at++;
        _at %= _total;
        [self setImage:(UIImage*)[_imageArray objectAtIndex:_at] forState:UIControlStateNormal];
    }

}

- (void) onTempSwitch:(BOOL)isOn :(BOOL)isLeft{
    if( _isLeft == isLeft ){
        _isOn = isOn;
        if( _isOn){
            [self setImage:(UIImage*)[_imageArray objectAtIndex:_at] forState:UIControlStateNormal];
        }else{
            [self setImage:(UIImage*)[_offArray objectAtIndex:_at] forState:UIControlStateNormal];
        }
    }
}




@end
