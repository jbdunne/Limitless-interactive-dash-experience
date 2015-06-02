//
//  KeypadView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "KeypadView.h"

@implementation KeypadView


- (instancetype) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        
        // FAVORITE BUTTONS
        _favNames = @[@"Boram Kim", @"Gene Han", @"Jason Dunne"];
        _isFav = false;
        
        _favBtn0 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_favBtn0 setFrame:CGRectMake(0, 0, 242, 67)];
        [_favBtn0 setBackgroundImage:[UIImage imageNamed:@"phone_favorites_button1"] forState:UIControlStateNormal];
        [_favBtn0 setBackgroundImage:[UIImage imageNamed:@"phone_favorites_button1_pressed"] forState:UIControlStateHighlighted];
        _favBtn0.tag = 0;
        
        [_favBtn0 addTarget:self action:@selector(onFavoriteBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _favBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_favBtn1 setFrame:CGRectMake(250, 0, 242, 67)];
        [_favBtn1 setBackgroundImage:[UIImage imageNamed:@"phone_favorites_button2"] forState:UIControlStateNormal];
        [_favBtn1 setBackgroundImage:[UIImage imageNamed:@"phone_favorites_button2_pressed"] forState:UIControlStateHighlighted];
        _favBtn1.tag = 1;
        [_favBtn1 addTarget:self action:@selector(onFavoriteBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _favBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_favBtn2 setFrame:CGRectMake(500, 0, 242, 67)];
        [_favBtn2 setBackgroundImage:[UIImage imageNamed:@"phone_favorites_button3"] forState:UIControlStateNormal];
        [_favBtn2 setBackgroundImage:[UIImage imageNamed:@"phone_favorites_button3_pressed"] forState:UIControlStateHighlighted];
        _favBtn2.tag = 2;
        [_favBtn2 addTarget:self action:@selector(onFavoriteBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        // CALL BUTOONS
        _keyTextField = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH-141-32-79-32, 89)];
        [_keyTextField setTextAlignment:NSTextAlignmentRight];
        [_keyTextField setTextColor:TEMP_ON_COLOR];
        [_keyTextField setText:@""];
        [_keyTextField setFont:[UIFont systemFontOfSize:75]];
        _dialString = @"";
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setFrame:CGRectMake(SCREEN_WIDTH-141-32-79, 110, 79, 54)];
        [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"phone_dialer_delete"] forState:UIControlStateNormal];
        [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"phone_dialer_delete_pressed"] forState:UIControlStateHighlighted];
        [_deleteBtn addTarget:self action:@selector(onCallDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        _callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_callBtn setFrame:CGRectMake(SCREEN_WIDTH-141, 100, 141, 89)];
        [_callBtn setBackgroundImage:[UIImage imageNamed:@"phone_dialer_call"] forState:UIControlStateNormal];
        [_callBtn addTarget:self action:@selector(onCallCallBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        // Key Pad
        // # 1
        _key1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key1 setFrame:CGRectMake(0, 243, 256, 104)];
        [_key1 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_1"] forState:UIControlStateNormal];
        [_key1 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_1_pressed"] forState:UIControlStateHighlighted];
        _key1.tag = 1;
        [_key1 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 2
        _key2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key2 setFrame:CGRectMake(256, 243, 256, 104)];
        [_key2 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_2"] forState:UIControlStateNormal];
        [_key2 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_2_pressed"] forState:UIControlStateHighlighted];
        _key2.tag = 2;
        [_key2 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 3
        _key3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key3 setFrame:CGRectMake(512, 243, 256, 104)];
        [_key3 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_3"] forState:UIControlStateNormal];
        [_key3 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_3_pressed"] forState:UIControlStateHighlighted];
        _key3.tag = 3;
        [_key3 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        // # 4
        _key4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key4 setFrame:CGRectMake(0, 243+(104*1), 256, 104)];
        [_key4 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_4"] forState:UIControlStateNormal];
        [_key4 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_4_pressed"] forState:UIControlStateHighlighted];
        _key4.tag = 4;
        [_key4 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 5
        _key5 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key5 setFrame:CGRectMake(256, 243+(104*1), 256, 104)];
        [_key5 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_5"] forState:UIControlStateNormal];
        [_key5 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_5_pressed"] forState:UIControlStateHighlighted];
        _key5.tag = 5;
        [_key5 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 6
        _key6 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key6 setFrame:CGRectMake(512, 243+(104*1), 256, 104)];
        [_key6 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_6"] forState:UIControlStateNormal];
        [_key6 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_6_pressed"] forState:UIControlStateHighlighted];
        _key6.tag = 6;
        [_key6 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 7
        _key7 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key7 setFrame:CGRectMake(0, 243+(104*2), 256, 104)];
        [_key7 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_7"] forState:UIControlStateNormal];
        [_key7 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_7_pressed"] forState:UIControlStateHighlighted];
        _key7.tag = 7;
        [_key7 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 8
        _key8 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key8 setFrame:CGRectMake(256, 243+(104*2), 256, 104)];
        [_key8 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_8"] forState:UIControlStateNormal];
        [_key8 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_8_pressed"] forState:UIControlStateHighlighted];
        _key8.tag = 8;
        [_key8 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 9
        _key9 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key9 setFrame:CGRectMake(512, 243+(104*2), 256, 104)];
        [_key9 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_9"] forState:UIControlStateNormal];
        [_key9 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_9_pressed"] forState:UIControlStateHighlighted];
        _key9.tag = 9;
        [_key9 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # star
        _keyStar = [UIButton buttonWithType:UIButtonTypeCustom];
        [_keyStar setFrame:CGRectMake(0, 243+(104*3), 256, 104)];
        [_keyStar setBackgroundImage:[UIImage imageNamed:@"phone_dialer_*"] forState:UIControlStateNormal];
        [_keyStar setBackgroundImage:[UIImage imageNamed:@"phone_dialer_*_pressed"] forState:UIControlStateHighlighted];
        _keyStar.tag = -1;
        [_keyStar addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # 0
        _key0 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_key0 setFrame:CGRectMake(256, 243+(104*3), 256, 104)];
        [_key0 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_0"] forState:UIControlStateNormal];
        [_key0 setBackgroundImage:[UIImage imageNamed:@"phone_dialer_0_pressed"] forState:UIControlStateHighlighted];
        _key0.tag = 0;
        [_key0 addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // # sharp
        _keySharp = [UIButton buttonWithType:UIButtonTypeCustom];
        [_keySharp setFrame:CGRectMake(512, 243+(104*3), 256, 104)];
        [_keySharp setBackgroundImage:[UIImage imageNamed:@"phone_dialer_#"] forState:UIControlStateNormal];
        [_keySharp setBackgroundImage:[UIImage imageNamed:@"phone_dialer_#_pressed"] forState:UIControlStateHighlighted];
        _keySharp.tag = -2;
        [_keySharp addTarget:self action:@selector(onKeypadBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        
        
        
        
        // ADD VIEW
        [self addSubview:_favBtn0];
        [self addSubview:_favBtn1];
        [self addSubview:_favBtn2];
        
        
        [self addSubview:_keyTextField];
        [self addSubview:_deleteBtn];
        [self addSubview:_callBtn];
        

        [self addSubview:_key1];
        [self addSubview:_key2];
        [self addSubview:_key3];
        
        [self addSubview:_key4];
        [self addSubview:_key5];
        [self addSubview:_key6];
        
        [self addSubview:_key7];
        [self addSubview:_key8];
        [self addSubview:_key9];
        
        [self addSubview:_keyStar];
        [self addSubview:_key0];
        [self addSubview:_keySharp];
        
        
    }
    return self;
}



// FAV BUTTONS

- (void) onFavoriteBtn:(id) btn{
    NSInteger at = ((UIButton*)btn).tag;
    _dialString = (NSString*)[_favNames objectAtIndex:at];
    [_keyTextField setText:_dialString];
    _isFav = true;
    

}

// KEYPAD BUTTONS

- (void) onKeypadBtn:(id) btn{
    if( _isFav ){
        _isFav = false;
        _dialString = @"";
    }
    
    
    NSInteger at = ((UIButton*)btn).tag;
    NSLog(@"[KeyPadView] onKey:%ld", (long)at);
    if( at == -1){
        _dialString = [NSString stringWithFormat:@"%@*",_dialString];
        [_keyTextField setText:_dialString];
    }else if( at == -2){
        _dialString = [NSString stringWithFormat:@"%@#",_dialString];
        [_keyTextField setText:_dialString];
    }else{
        _dialString = [NSString stringWithFormat:@"%@%ld",_dialString, (long)at];
        [_keyTextField setText:_dialString];
    }
}

// CALL BUTTONS
- (void) onCallDeleteBtn:(id) btn{
    NSLog(@"[KeyPadView] onCallDeleteBtn");
    _dialString = @"";
    [_keyTextField setText:_dialString];
}

- (void) onCallCallBtn:(id) btn{
    NSLog(@"[KeyPadView] onCallCallBtn");
    [self.delegate onDialedTo:_dialString];
}







@end
