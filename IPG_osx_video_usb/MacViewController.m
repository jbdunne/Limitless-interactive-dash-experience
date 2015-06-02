//
//  MacViewController.m
//  IPG_osx_video_usb
//
//  Created by Gene Han on 3/30/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "MacViewController.h"

static void *AVSPPlayerItemStatusContext = &AVSPPlayerItemStatusContext;
static void *AVSPPlayerRateContext = &AVSPPlayerRateContext;
static void *AVSPPlayerLayerReadyForDisplay = &AVSPPlayerLayerReadyForDisplay;

@interface MacViewController (){
    int _videoNum;
}
@end

@implementation MacViewController

- (void)viewDidAppear{
    ((MacWindow*)[[self view] window]).windowDelegate = self;
    self.window = (MacWindow*)[[self view] window];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _videoNum = 1;
    

    
    self.playerView.layer.backgroundColor = CGColorGetConstantColor(kCGColorBlack);
    [self loadVideoAsset];

}


- (void) loadVideoAsset{
    
    _player = [[AVPlayer alloc]init];
    [self addObserver:self forKeyPath:@"player.rate" options:NSKeyValueObservingOptionNew context:AVSPPlayerRateContext];
    [self addObserver:self forKeyPath:@"player.currentItem.status" options:NSKeyValueObservingOptionNew context:AVSPPlayerItemStatusContext];
    
    _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[_player currentItem]];
    
    
    
    
    // video assets
    NSURL* video1URL = [NSURL fileURLWithPath:@"/Users/genehan/Documents/ITP/IPG_osx_ios/IPG_osx_video_usb/Resources/video1_4k.mp4"];
    AVURLAsset *asset1 = [AVAsset assetWithURL:video1URL];
    _video1 = [AVPlayerItem playerItemWithAsset:asset1];
    
    NSURL* video2URL = [NSURL fileURLWithPath:@"/Users/genehan/Documents/ITP/IPG_osx_ios/IPG_osx_video_usb/Resources/video2_4k.mp4"];
    AVURLAsset *asset2 = [AVAsset assetWithURL:video2URL];
    _video2 = [AVPlayerItem playerItemWithAsset:asset2];
    _videoNum = 2;
    
    
    
    // video layer
    [_playerView setFrame:NSMakeRect(0, 0, 1920, 1200)];
    AVPlayerLayer *newPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    newPlayerLayer.frame = NSMakeRect(0, 0, 1920, 1200);
    newPlayerLayer.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
    [self.playerView.layer addSublayer:newPlayerLayer];
    self.playerLayer = newPlayerLayer;
    [self addObserver:self forKeyPath:@"playerLayer.readyForDisplay" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:AVSPPlayerLayerReadyForDisplay];
    
    [self.player replaceCurrentItemWithPlayerItem:_video2];

    
    
    NSButton * switchBtn = [[NSButton alloc] initWithFrame:NSMakeRect(100, 100, 100, 100)];
    [switchBtn setTitle:@"[SWITCH]"];
    [switchBtn setTarget:self];
    [switchBtn setAction:@selector(switchVideo:)];
    
    [_playerView addSubview:switchBtn];
    
}


- (void)setUpPlaybackOfAsset:(AVAsset *)asset withKeys:(NSArray *)keys
{
    // This method is called when the AVAsset for our URL has completing the loading of the values of the specified array of keys.
    // We set up playback of the asset here.
    
    // First test whether the values of each of the keys we need have been successfully loaded.
    for (NSString *key in keys)
    {
        NSError *error = nil;
        
        if ([asset statusOfValueForKey:key error:&error] == AVKeyValueStatusFailed)
        {
            [self stopAllShowError:error];
            return;
        }
    }
    
    if (![asset isPlayable] || [asset hasProtectedContent])
    {
        // We can't play this asset. Show the "Unplayable Asset" label.
        [self stopAllShowError:nil];
        return;
    }
    
    // We can play this asset.
    // Set up an AVPlayerLayer according to whether the asset contains video.
    if ([[asset tracksWithMediaType:AVMediaTypeVideo] count] != 0)
    {
        // Create an AVPlayerLayer and add it to the player view if there is video, but hide it until it's ready for display
        NSLog(@"[PV] frame- %f, %f, %f, %f", _playerView.frame.origin.x, _playerView.frame.origin.y, _playerView.frame.size.width, _playerView.frame.size.height);
        [_playerView setFrame:NSMakeRect(0, 0, 1920, 1200)];
        AVPlayerLayer *newPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        newPlayerLayer.frame = NSMakeRect(0, 0, 1920, 1200);
        newPlayerLayer.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
        newPlayerLayer.hidden = YES;
        [self.playerView.layer addSublayer:newPlayerLayer];
        self.playerLayer = newPlayerLayer;
        [self addObserver:self forKeyPath:@"playerLayer.readyForDisplay" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:AVSPPlayerLayerReadyForDisplay];
    }
    else
    {
        // This asset has no video tracks. Show the "No Video" label.
        [self stopAllShowError:nil];
    }
    
    // Create a new AVPlayerItem and make it our player's current item.
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    
    // If needed, configure player item here (example: adding outputs, setting text style rules, selecting media options) before associating it with a player
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    
    
}



- (void) stopAllShowError:(NSError *) error{
    if (error)
    {
        NSLog(@"Error: %@", error.description);
    }
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == AVSPPlayerItemStatusContext)
    {
        AVPlayerStatus status = [change[NSKeyValueChangeNewKey] integerValue];
        BOOL enable = NO;
        switch (status)
        {
            case AVPlayerItemStatusUnknown:
                break;
            case AVPlayerItemStatusReadyToPlay:
                enable = YES;
                break;
            case AVPlayerItemStatusFailed:
                [self stopAllShowError:[[[self player] currentItem] error]];
                break;
        }
        
     //   self.playPauseButton.enabled = enable;
     //   self.fastForwardButton.enabled = enable;
     //   self.rewindButton.enabled = enable;
    }
    else if (context == AVSPPlayerRateContext)
    {
        float rate = [change[NSKeyValueChangeNewKey] floatValue];
        if (rate != 1.f)
        {
         //   self.playPauseButton.title = @"Play";
        }
        else
        {
        //    self.playPauseButton.title = @"Pause";
        }
    }
    else if (context == AVSPPlayerLayerReadyForDisplay)
    {
        if ([change[NSKeyValueChangeNewKey] boolValue] == YES)
        {
            // The AVPlayerLayer is ready for display. Hide the loading spinner and show it.
            [self stopAllShowError:nil];
            self.playerLayer.hidden = NO;
            NSLog(@"[MVC] AVSPPlayerLayerReadyForDisplay");
            
            
            [_player play];
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}





#pragma mark - NSWindowDelegate
- (void)windowDidResize:(NSNotification *)notification{
    NSLog(@"[MVC] windowDidResize");
}

- (void)windowDidEnterFullScreen:(NSNotification *)notification{
    NSLog(@"[MVC] enter FULL SCREEN");
    
    
}

- (void)windowDidExitFullScreen:(NSNotification *)notification{
    NSLog(@"[MVC} exit FULL SCREEN");
    [_playerView setFrame:_window.frame];
    [_playerLayer setFrame:_window.frame];
}
          


#pragma mark - IBACtion

- (void) switchVideo:(id)sender{
    NSLog(@"[MVC] switch play 2");

    if( _videoNum == 1){
        [self.player replaceCurrentItemWithPlayerItem:_video2];
        _videoNum = 2;
        [_player play];
        NSLog(@"[MVC] switch play 2");
        // Send msg to iphone
        [self sendMessage:[NSString stringWithFormat:@"[PLAYING] video2"]];
        
        
    }else{
        [self.player replaceCurrentItemWithPlayerItem:_video1];
        _videoNum = 1;
        [_player play];
        NSLog(@"[MVC] switch play 1");
        // Send msg to iphone
        [self sendMessage:[NSString stringWithFormat:@"[PLAYING] video1"]];
    }

}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}



#pragma mark - PeerTalk

- (void) sendMessage:(NSString *) msg{
    
    AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    
    if (appDelegate.connectedChannel) {
        dispatch_data_t payload = PTTextDispatchDataWithString(msg);
        [appDelegate.connectedChannel sendFrameOfType:PTFrameTypeTextMessage tag:PTFrameNoTag withPayload:payload callback:^(NSError *error) {
            if (error) {
                NSLog(@"Failed to send message: %@", error);
            }
        }];
    }

}




@end
