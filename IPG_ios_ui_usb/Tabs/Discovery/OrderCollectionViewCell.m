//
//  OrderCollectionViewCell.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "OrderCollectionViewCell.h"

@implementation OrderCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    if( self =  [super initWithFrame:frame]){
        _itemImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 256, 163)];
        [self addSubview:_itemImage];
    }
    return self;
}


- (void)applyOrderItem:(OrderItemData *)orderItem{
    
    [_itemImage setImage:[orderItem getItemImage]];

}


@end
