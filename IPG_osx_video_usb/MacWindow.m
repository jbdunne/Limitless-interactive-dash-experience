//
//  MacWindow.m
//  IPG_osx_ios
//
//  Created by Gene Han on 4/1/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "MacWindow.h"

@implementation MacWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    [self setDelegate:self];
    return self;
}

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag screen:(NSScreen *)screen{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag screen:screen];
    [self setDelegate:self];
    return self;
}



#pragma mark - NSWindowDelegate

- (void)windowDidResize:(NSNotification *)notification{
    [self.windowDelegate windowDidResize:notification];
}

- (void) windowDidEnterFullScreen:(NSNotification *)notification{
    [self.windowDelegate windowDidEnterFullScreen:notification];
}

- (void)windowDidExitFullScreen:(NSNotification *)notification{
    [self.windowDelegate windowDidExitFullScreen:notification];
}


@end
