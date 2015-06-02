//
//  MusicView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 4/13/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "MusicView.h"



@implementation MusicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame: CGRectMake(0, frame.origin.y, frame.size.width, frame.size.height)];
    
    // 0. values
    _now_at = 0;
    _isPlaying = false;
    // 1. create scroll view
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 433-TOP_UI_HEIGHT - TOP_UI_GAP, SCREEN_WIDTH, SCROLL_WIDTH)];
    _scrollView.pagingEnabled = YES;
    
    _inviScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - SCROLL_WIDTH)/2, 433-TOP_UI_HEIGHT - TOP_UI_GAP, SCROLL_WIDTH+SCROLL_GAP, SCROLL_WIDTH)];
    _inviScrollView.pagingEnabled = YES;
    _inviScrollView.userInteractionEnabled = NO;
    _inviScrollView.delegate = self;
    
    [_scrollView addGestureRecognizer:_inviScrollView.panGestureRecognizer];

    
    [self addSubview:_scrollView];
    [self addSubview:_inviScrollView];
    
    // 2. create page
    _svl = [NSMutableArray new];
    NSString * path;
    NSURL * soundUrl;
    
    MusicData * data1 = [[MusicData alloc] init];
    data1.image = [UIImage imageNamed:@"caribou_ourlove.jpg"];
    path = [NSString stringWithFormat:@"%@/01.m4a", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    data1.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    MusicData * data2 = [[MusicData alloc] init];
    data2.image = [UIImage imageNamed:@"daftpunk_ram.jpg"];
    path = [NSString stringWithFormat:@"%@/02.m4a", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    data2.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    MusicData * data3 = [[MusicData alloc] init];
    data3.image = [UIImage imageNamed:@"flyinglotus_cosmogramma.jpg"];
    path = [NSString stringWithFormat:@"%@/03.m4a", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    data3.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    MusicData * data4 = [[MusicData alloc] init];
    data4.image = [UIImage imageNamed:@"justice_audiovideodisco.jpg"];
    path = [NSString stringWithFormat:@"%@/04.m4a", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    data4.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    MusicData * data5 = [[MusicData alloc] init];
    data5.image = [UIImage imageNamed:@"tycho_awake.jpg"];
    path = [NSString stringWithFormat:@"%@/05.m4a", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    data5.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_svl addObject:data1];
    [_svl addObject:data2];
    [_svl addObject:data3];
    [_svl addObject:data4];
    [_svl addObject:data5];
    
     
    UIView * coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,(SCREEN_WIDTH - SCROLL_WIDTH)/2+ _svl.count * (SCROLL_GAP+SCROLL_WIDTH) +SCROLL_GAP, SCROLL_WIDTH)];
    NSLog(@"[COVERVIEW] width:%lu", _svl.count * (SCROLL_GAP+SCROLL_WIDTH) +SCROLL_GAP);
    [coverView setBackgroundColor:[UIColor clearColor]];
    
    for( NSInteger i = 0 ; i < _svl.count ; i++){
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - SCROLL_WIDTH)/2 + i*(SCROLL_WIDTH+SCROLL_GAP), 0, SCROLL_WIDTH, SCROLL_WIDTH)];
        imgView.image = ((MusicData*)_svl[i]).image;
        [coverView addSubview:imgView];
    }
    
    // 3. link
    [_scrollView addSubview:coverView];
    [_scrollView setContentSize:coverView.frame.size];
    [_inviScrollView setContentSize:coverView.frame.size];
    
    // 4. buttons
    _prevBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_prevBtn setFrame:CGRectMake(130, 288 - TOP_UI_HEIGHT - TOP_UI_GAP, 93, 93)];
    [_prevBtn setBackgroundImage:[UIImage imageNamed:@"music_rw"] forState:UIControlStateNormal];
    [_prevBtn setBackgroundImage:[UIImage imageNamed:@"music_rw_pressed"] forState:UIControlStateHighlighted];
    [_prevBtn addTarget:self action:@selector(onPrevBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_prevBtn];
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_playBtn setFrame:CGRectMake(321, 272 - TOP_UI_HEIGHT - TOP_UI_GAP, 126, 126)];
    [_playBtn setBackgroundImage:[UIImage imageNamed:@"music_play"] forState:UIControlStateNormal];
    [_playBtn setBackgroundImage:[UIImage imageNamed:@"music_play_pressed"] forState:UIControlStateHighlighted];
    [_playBtn addTarget:self action:@selector(onPlayBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playBtn];
    
    _nextBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_nextBtn setFrame:CGRectMake(534, 288 - TOP_UI_HEIGHT - TOP_UI_GAP, 93, 93)];
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"music_ff"] forState:UIControlStateNormal];
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"music_ff_pressed"] forState:UIControlStateHighlighted];
    [_nextBtn addTarget:self action:@selector(onNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_nextBtn];
    
    
    
    
    // DEBUG
    [_scrollView setBackgroundColor:[UIColor clearColor]];
   // [_inviScrollView setBackgroundColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0.5f]];

    return self;
}
#pragma mark - SCROLL VIEW DELEGATE
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_inviScrollView){
        _scrollView.contentOffset = _inviScrollView.contentOffset;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger at = scrollView.contentOffset.x/(SCROLL_WIDTH+SCROLL_GAP);
    NSLog(@"[MUSIC] %ld", (long)at);
    if( _now_at != at){
        if( _isPlaying){
            [((MusicData*)_svl[_now_at]).player stop];
            [((MusicData*)_svl[at]).player play];
        }
        _now_at = at;
    }
    NSLog(@"[offset] at %li (%f,%f)",(long)at,scrollView.contentOffset.x, scrollView.contentOffset.y);
}

#pragma mark - ON BUTTON CLICK
- (void) onPrevBtn{
    NSLog(@"[onPrevBtn]");
    if( _now_at > 0){
        _now_at--;
        if( _isPlaying){
            [((MusicData*)_svl[_now_at +1]).player stop];
            [((MusicData*)_svl[_now_at]).player play];
        }
        [_inviScrollView setContentOffset:CGPointMake(_now_at*(SCROLL_WIDTH+SCROLL_GAP), 0) animated:YES];
    }
}

- (void) onNextBtn{
    NSLog(@"[onNextBtn]");
    if( _now_at < _svl.count-1){
        _now_at++;
        if( _isPlaying){
            [((MusicData*)_svl[_now_at -1]).player stop];
            [((MusicData*)_svl[_now_at]).player play];
        }
        [_inviScrollView setContentOffset:CGPointMake(_now_at*(SCROLL_WIDTH+SCROLL_GAP), 0) animated:YES];
    }
}

- (void) onPlayBtn{
    NSLog(@"[onPlayBtn]");
    if( _isPlaying ){
        _isPlaying = false;
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"music_play"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"music_play_pressed"] forState:UIControlStateHighlighted];
        [((MusicData*)_svl[_now_at]).player stop];
    }else{
        _isPlaying = true;
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"music_pause"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"music_pause_pressed"] forState:UIControlStateHighlighted];
        [((MusicData*)_svl[_now_at]).player play];
    }
}












@end
