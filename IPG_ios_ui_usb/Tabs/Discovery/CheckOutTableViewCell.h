//
//  CheckOutTableViewCell.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/19/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"

@interface CheckOutTableViewCell : UITableViewCell
@property (strong,nonatomic) UILabel * itemName;
@property (strong, nonatomic) UILabel * itemPrice;

- (void) loadName:(NSString *) name andPrice:(NSString*)price;

@end
