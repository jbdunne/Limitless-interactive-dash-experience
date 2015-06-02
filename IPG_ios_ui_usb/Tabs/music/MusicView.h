//
//  MusicView.h
//  IPG_osx_ios
//
//  Created by Gene Han on 4/13/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
#import "MusicData.h"

@interface MusicView : UIView<UIScrollViewDelegate>

@property UIScrollView * scrollView;
@property UIScrollView * inviScrollView;
@property NSInteger now_at;

@property NSMutableArray * svl;

@property UIButton * prevBtn;
@property UIButton * nextBtn;
@property UIButton * playBtn;
@property BOOL isPlaying;


@end
