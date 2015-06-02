//
//  MusicViewController.h
//  IPG_osx_ios
//
//  Created by Gene Han on 4/13/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicView.h"
#import "config.h"
#import "TopUI.h"
#import "DiscoveryView.h"

@interface MusicViewController : UIViewController

@property MusicView * musicView;
@property DiscoveryView * dView;
@property TopUI * topUI;

@end
