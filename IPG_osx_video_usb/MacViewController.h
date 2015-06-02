//
//  MacViewController.h
//  IPG_osx_video_usb
//
//  Created by Gene Han on 3/30/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MacWindow.h"
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
#import "PTChannel.h"
#import "IPGProcotol.h"

@class AVPlayer, AVPlayerLayer;

@interface MacViewController : NSViewController<NSWindowDelegate>


@property (strong) AVPlayer *player;

@property (strong) AVPlayerLayer *playerLayer;
@property (weak) IBOutlet NSView *playerView;
@property (weak) IBOutlet NSView * dashView;




@property (weak,nonatomic) MacWindow * window;


// video preloads
@property (strong) AVPlayerItem * video1;
@property (strong) AVPlayerItem * video2;


@end
