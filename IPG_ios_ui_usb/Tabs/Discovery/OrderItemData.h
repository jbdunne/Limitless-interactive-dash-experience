//
//  OrderItemData.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderItemData : NSObject

@property (strong, nonatomic) NSString * itemName;
@property (strong, nonatomic) NSString * itemPrice;
@property (strong, nonatomic) UIImage * itemImage;
@property (strong, nonatomic) UIImage * itemImagePressed;
@property (assign, nonatomic) BOOL isSelected;

- (UIImage *) getItemImage;

- (instancetype) initWithItem:(OrderItemData*)item;
@end
