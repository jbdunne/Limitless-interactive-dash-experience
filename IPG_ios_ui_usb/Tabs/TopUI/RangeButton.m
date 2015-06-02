//
//  RangeButton.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "RangeButton.h"

@implementation RangeButton

- (instancetype)initWithFrame:(CGRect)frame withOnImages:(NSArray*)onImages withOffImages:(NSArray*) offImage{
    if( self = [super initWithFrame:frame]){
        
        _total = [onImages count];
        _at = _total;
        
        _onImages = onImages;
        _offImages = offImage;
        
        
        _imgViewArray = [[NSMutableArray alloc] initWithCapacity:_total];
        for( int i = 0 ; i < _total ; i++){
            UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*25, 0, 25, 74)];
            [imgView setImage:(UIImage *)[_onImages objectAtIndex:i]];
            [_imgViewArray insertObject:imgView atIndex:i];
            [self addSubview:imgView];
        }
        _isOn = true;
        
        [self addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void) onClick{
    if( _isOn ){
        _at++;
        _at %= (_total+1);
        
        if( _at == 0){
            for( int i = 0 ; i < _total ; i++){
                UIImageView * imgView = (UIImageView*) [_imgViewArray objectAtIndex:i];
                [imgView setImage:(UIImage*)[_offImages objectAtIndex:i]];
            }
        }else{
            UIImageView * imgView =(UIImageView*)[_imgViewArray objectAtIndex:(_at-1)];
            [imgView setImage:(UIImage*)[_onImages objectAtIndex:_at-1]];
        }
    }
}


- (void) onTempSwitch:(BOOL)isOn :(BOOL)isLeft{
    if( _isLeft == isLeft ){
        _isOn = isOn;
        for( int i = 0 ; i < _total; i++){
            UIImageView * imgView = (UIImageView*) [_imgViewArray objectAtIndex:i];
            [imgView setImage:(UIImage*)[_offImages objectAtIndex:i]];
        }
        
        if( _isOn ){
            for( int i = 0 ; i < _at ; i++){
                UIImageView * imgView = (UIImageView*) [_imgViewArray objectAtIndex:i];
                [imgView setImage:(UIImage*)[_onImages objectAtIndex:i]];
            }
        }
        
    }
}

@end
