//
//  OrderItemData.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "OrderItemData.h"

@implementation OrderItemData


- (instancetype)init{
    if( self = [super init]){
        _isSelected = false;
    }
    return self;
}

- (UIImage *)getItemImage{
    if( _isSelected){
        return _itemImagePressed;
    }else{
        return _itemImage;
    }
}


- (instancetype) initWithItem:(OrderItemData*)item{
    if( self = [super init]){
        _isSelected = false;
        _itemName = [item.itemName copy];
        _itemPrice = [item.itemPrice copy];
    }
    return self;
}

@end
