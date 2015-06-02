//
//  MusicViewController.m
//  IPG_osx_ios
//
//  Created by Gene Han on 4/13/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 0.1 TOP UI
 //   _topUI = [TopUI sharedInstance];
    [self.view addSubview:_topUI];
    
    // 0.2 Discovery View
    _dView = [DiscoveryView sharedInstance];
    
    UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUpFrom:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUpGestureRecognizer];
    
    UISwipeGestureRecognizer* swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDownFrom:)];
    swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDownGestureRecognizer];
    
    
    // 1. MusicView
  //  _musicView = [[MusicView alloc] initWithFrame:CGRectMake(0, TOP_HEIGHT, SCREEN_WIDTH, SCROLL_WIDTH//+SCROLL_WIDTH)];
  //  [self.view addSubview:_musicView];
    
   // [self.view addSubview:_dView];
    
}


#pragma mark - GestureControl
- (void)handleSwipeUpFrom:(UIGestureRecognizer*)recognizer {
    [_dView showDiscovery:DiscoveryTypeSuggestion];
}

- (void)handleSwipeDownFrom:(UIGestureRecognizer*)recognizer {
    [_dView hideDiscovery];
}

@end
