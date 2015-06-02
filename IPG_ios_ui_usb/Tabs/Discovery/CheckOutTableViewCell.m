//
//  CheckOutTableViewCell.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/19/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "CheckOutTableViewCell.h"

@implementation CheckOutTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setBackgroundColor:[UIColor clearColor]];

        _itemName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-104) -100 , 75)];
        [_itemName setTextColor:TEMP_ON_COLOR];
        
        _itemPrice = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-104) -130, 0, 100, 75)];
        [_itemPrice setTextColor:TEMP_ON_COLOR];
        [_itemPrice setTextAlignment:NSTextAlignmentRight];
        
        [self addSubview:_itemName];
        [self addSubview:_itemPrice];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    // Configure the view for the selected state
}


- (void) loadName:(NSString *) name andPrice:(NSString*)price{
    [_itemName setText:name];
    [_itemPrice setText:price];
}

@end
