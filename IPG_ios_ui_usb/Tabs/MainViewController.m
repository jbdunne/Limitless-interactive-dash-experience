//
//  MainViewController.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/10/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "MainViewController.h"
#import "IPGProcotol.h"


@interface MainViewController (){
    __weak PTChannel *serverChannel_;
    __weak PTChannel *peerChannel_;
}

@end



@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeView];

    // PT
    // Create a new channel that is listening on our IPv4 port
    PTChannel *channel = [PTChannel channelWithDelegate:self];
    [channel listenOnPort:PTProtocolIPv4PortNumber IPv4Address:INADDR_LOOPBACK callback:^(NSError *error) {
        if (error) {
            [self appendOutputMessage:[NSString stringWithFormat:@"Failed to listen on 127.0.0.1:%d: %@", PTProtocolIPv4PortNumber, error]];
        } else {
            [self appendOutputMessage:[NSString stringWithFormat:@"Listening on 127.0.0.1:%d", PTProtocolIPv4PortNumber]];
            serverChannel_ = channel;
        }
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTimeToSendMsg:) name:@"IPAD_OUT" object:nil];
}

- (void) onTimeToSendMsg:(NSNotification*)noti{
    NSDictionary * userInfo = noti.userInfo;
    NSString * msg = [userInfo objectForKey:@"IPAD_OUT"];
    [self sendVidMessage:msg];
}


- (void)viewDidUnload {
    if (serverChannel_) {
        [serverChannel_ close];
    }
    [super viewDidUnload];
}

- (void) initializeView{
    [self.view setBackgroundColor:BG_COLOR];
    
    // START VIEW
    _startView = [[StartView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    // TOP/BOT UI
    _topUI = [[TopUI alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOP_UI_HEIGHT)];
    _botUI = [[BotUI alloc] initWithFrame:CGRectMake(0, BOT_UI_Y, SCREEN_WIDTH, BOT_UI_HEIGHT)];
    [_botUI setDelegate:self];
    
    UIImageView * divImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, TOP_UI_HEIGHT, SCREEN_HEIGHT, 22)];
    [divImgView setImage:[UIImage imageNamed:@"divider"]];
    [self.view addSubview:divImgView];
    
    
    // MID VIEW
    _homeView  = [[HomeView alloc] initWithFrame:CGRectMake(0, MID_VIEW_Y, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
    _discView  = [[DiscoveryView alloc] initWithFrame:CGRectMake(0, MID_VIEW_Y, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
    _musicView = [[MusicView alloc] initWithFrame:CGRectMake(0, MID_VIEW_Y, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
    _phoneView = [[PhoneView alloc] initWithFrame:CGRectMake(0, MID_VIEW_Y, SCREEN_WIDTH, MID_VIEW_HEIGHT)];
    
    _notiView = [[NotiView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOP_UI_HEIGHT)];
    
    _viewArray = @[_homeView, _discView, _musicView, _phoneView];
    
    // ADD UI
    [self.view addSubview:_topUI];
    [self.view addSubview:_botUI];
    
    // Views
    [self.view addSubview:_homeView];
 
    // Noti
    [self.view addSubview:_notiView];
    
    
    //START
    [self.view addSubview:_startView];
    
    
    
    
    _resetTimer = [NSTimer scheduledTimerWithTimeInterval:5.f target:self selector:@selector(resetToStart) userInfo:nil repeats:NO];
    
}

- (void) resetToStart{
    [_botUI switchNavTo:0];
    [self.view addSubview:_startView];
}


// BOT UI DELEGATE
- (void) onNavigationFrom:(NSInteger)from to:(NSInteger)to{
    
    [_resetTimer invalidate];
    
    UIView * currView = (UIView*)[_viewArray objectAtIndex:from];
    [currView removeFromSuperview];
    
    UIView * nextView = (UIView*)[_viewArray objectAtIndex:to];
    [self.view addSubview:nextView];
    
   // [self sendMessage:[NSString stringWithFormat:@"[IOS] Nav at %ld",(long)to]];

}




#pragma mark - Communicating

- (void)sendMessage:(NSString*)message {/*
    NSLog(@"[Channel] send msg:%@", message);
    if (peerChannel_) {
        dispatch_data_t payload = PTTextDispatchDataWithString(message);
        [peerChannel_ sendFrameOfType:PTFrameTypeTextMessage tag:PTFrameNoTag withPayload:payload callback:^(NSError *error) {
            if (error) {
                NSLog(@"Failed to send message: %@", error);
            }
        }];
    }*/
}

- (void)sendVidMessage:(NSString*)message {
    NSLog(@"[Channel] send msg:%@", message);
    if (peerChannel_) {
        dispatch_data_t payload = PTTextDispatchDataWithString(message);
        [peerChannel_ sendFrameOfType:PTFrameTypeTextMessage tag:PTFrameNoTag withPayload:payload callback:^(NSError *error) {
            if (error) {
                NSLog(@"Failed to send message: %@", error);
            }
        }];
    }
}



- (void)appendOutputMessage:(NSString*)message {
    NSLog(@"[INC] %@", message);
    /*
     NSString *text = self.outputTextView.text;
     if (text.length == 0) {
     self.outputTextView.text = [text stringByAppendingString:message];
     } else {
     self.outputTextView.text = [text stringByAppendingFormat:@"\n%@", message];
     [self.outputTextView scrollRangeToVisible:NSMakeRange(self.outputTextView.text.length, 0)];
     }
     */
}

- (void)sendDeviceInfo {
    if (!peerChannel_) {
        return;
    }
    
    NSLog(@"Sending device info over %@", peerChannel_);
    
    UIScreen *screen = [UIScreen mainScreen];
    CGSize screenSize = screen.bounds.size;
    NSDictionary *screenSizeDict = (__bridge_transfer NSDictionary*)CGSizeCreateDictionaryRepresentation(screenSize);
    UIDevice *device = [UIDevice currentDevice];
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:
                          device.localizedModel, @"localizedModel",
                          [NSNumber numberWithBool:device.multitaskingSupported], @"multitaskingSupported",
                          device.name, @"name",
                          (UIDeviceOrientationIsLandscape(device.orientation) ? @"landscape" : @"portrait"), @"orientation",
                          device.systemName, @"systemName",
                          device.systemVersion, @"systemVersion",
                          screenSizeDict, @"screenSize",
                          [NSNumber numberWithDouble:screen.scale], @"screenScale",
                          nil];
    dispatch_data_t payload = [info createReferencingDispatchData];
    [peerChannel_ sendFrameOfType:PTFrameTypeDeviceInfo tag:PTFrameNoTag withPayload:payload callback:^(NSError *error) {
        if (error) {
            NSLog(@"Failed to send PTExampleFrameTypeDeviceInfo: %@", error);
        }
    }];
}

- (void) handleIncomingMsg:(NSString*) msg{
    
    if( [msg isEqualToString:@"y1"]){
        NSLog(@"[OSX] vid 1 end");
        [_botUI switchNavTo:1];
    }else if( [msg isEqualToString:@"y2"]){
        NSLog(@"[OSX] vid 2 end");
    }else if( [msg isEqualToString:@"y3"]){
        NSLog(@"[OSX] vid 3 end");
    }else if( [msg isEqualToString:@"y4"]){
        NSLog(@"[OSX] vid 4 end");
        
        [[NSRunLoop mainRunLoop] addTimer:_resetTimer forMode:NSRunLoopCommonModes];
    }
}





#pragma mark - PTChannelDelegate

// Invoked to accept an incoming frame on a channel. Reply NO ignore the
// incoming frame. If not implemented by the delegate, all frames are accepted.
- (BOOL)ioFrameChannel:(PTChannel*)channel shouldAcceptFrameOfType:(uint32_t)type tag:(uint32_t)tag payloadSize:(uint32_t)payloadSize {
    if (channel != peerChannel_) {
        // A previous channel that has been canceled but not yet ended. Ignore.
        return NO;
    } else if (type != PTFrameTypeTextMessage && type != PTFrameTypePing) {
        NSLog(@"Unexpected frame of type %u", type);
        [channel close];
        return NO;
    } else {
        return YES;
    }
}

// Invoked when a new frame has arrived on a channel.
- (void)ioFrameChannel:(PTChannel*)channel didReceiveFrameOfType:(uint32_t)type tag:(uint32_t)tag payload:(PTData*)payload {
    //NSLog(@"didReceiveFrameOfType: %u, %u, %@", type, tag, payload);
    
    if (type == PTFrameTypeTextMessage) {
        PTTextFrame *textFrame = (PTTextFrame*)payload.data;
        textFrame->length = ntohl(textFrame->length);
        NSString *message = [[NSString alloc] initWithBytes:textFrame->utf8text length:textFrame->length encoding:NSUTF8StringEncoding];
        [_ad setText:message];
        [self handleIncomingMsg:message];
        [self appendOutputMessage:[NSString stringWithFormat:@"[%@]: %@", channel.userInfo, message]];
    } else if (type == PTFrameTypePing && peerChannel_) {
        [peerChannel_ sendFrameOfType:PTFrameTypePong tag:tag withPayload:nil callback:nil];
    }
}

// Invoked when the channel closed. If it closed because of an error, *error* is
// a non-nil NSError object.
- (void)ioFrameChannel:(PTChannel*)channel didEndWithError:(NSError*)error {
    if (error) {
        [self appendOutputMessage:[NSString stringWithFormat:@"%@ ended with error: %@", channel, error]];
    } else {
        [self appendOutputMessage:[NSString stringWithFormat:@"Disconnected from %@", channel.userInfo]];
    }
}

// For listening channels, this method is invoked when a new connection has been
// accepted.
- (void)ioFrameChannel:(PTChannel*)channel didAcceptConnection:(PTChannel*)otherChannel fromAddress:(PTAddress*)address {
    // Cancel any other connection. We are FIFO, so the last connection
    // established will cancel any previous connection and "take its place".
    if (peerChannel_) {
        [peerChannel_ cancel];
    }
    
    // Weak pointer to current connection. Connection objects live by themselves
    // (owned by its parent dispatch queue) until they are closed.
    peerChannel_ = otherChannel;
    peerChannel_.userInfo = address;
    [self appendOutputMessage:[NSString stringWithFormat:@"Connected to %@", address]];
    
    // Send some information about ourselves to the other end
    [self sendDeviceInfo];
}




@end
