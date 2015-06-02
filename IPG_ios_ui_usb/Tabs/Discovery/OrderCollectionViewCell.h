//
//  OrderCollectionViewCell.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderItemData.h"
@interface OrderCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel * itemLabel;
@property (strong, nonatomic) UIImageView * itemImage;

- (void) applyOrderItem:(OrderItemData*)orderItem;

@end
