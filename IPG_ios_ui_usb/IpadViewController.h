//
//  IpadViewController.h
//  IPG_osx_ios
//
//  Created by Gene Han on 3/31/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTChannel.h"

@interface IpadViewController : UIViewController<PTChannelDelegate>



- (void)appendOutputMessage:(NSString*)message;
- (void)sendDeviceInfo;


@end
