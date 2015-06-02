//
//  CarlCheckoutView.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "CarlCheckoutView.h"

@implementation CarlCheckoutView

- (instancetype)initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        _logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(290, 261-TOP_UI_GAP-TOP_UI_HEIGHT, 188, 107)];
        [_logoImgView setImage:[UIImage imageNamed:@"discovery_cj_logo"]];
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(554, 353-TOP_UI_HEIGHT-TOP_UI_GAP, 100, 16)];
        [_countLabel setTextColor:TEMP_ON_COLOR];
        [_countLabel setTextAlignment:NSTextAlignmentRight];
        _countImgView = [[UIImageView alloc] initWithFrame:CGRectMake(1348/2, 353-TOP_UI_GAP-TOP_UI_HEIGHT, 64, 16)];
        [_countImgView setImage:[UIImage imageNamed:@"discovery_menu_items"]];
        
        _lineTopImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 393-TOP_UI_GAP-TOP_UI_HEIGHT, SCREEN_WIDTH, 3)];
        [_lineTopImgView setImage:[UIImage imageNamed:@"discovery_checkout_divider"]];
        _lineBotImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 393+300+64-TOP_UI_HEIGHT-TOP_UI_GAP, SCREEN_WIDTH, 3)];
        [_lineBotImgView setImage:[UIImage imageNamed:@"discovery_checkout_divider"]];
        
        _itemTableView = [[UITableView alloc] initWithFrame:CGRectMake(54, 393+32-TOP_UI_HEIGHT-TOP_UI_GAP, SCREEN_WIDTH-108, 300) style:UITableViewStylePlain];
        [_itemTableView setBackgroundColor:[UIColor clearColor]];
        [_itemTableView setDelegate:self];
        [_itemTableView setDataSource:self];
        [_itemTableView registerClass:[CheckOutTableViewCell class] forCellReuseIdentifier:@"CheckOutCell"];
        [_itemTableView setSeparatorColor:[UIColor clearColor]];
        [_itemTableView setAllowsSelection:NO];
        
        
        _TotalImgView = [[UIImageView alloc] initWithFrame:CGRectMake(548, [_lineBotImgView frame].origin.y+3+32, 72, 22)];
        [_TotalImgView setImage:[UIImage imageNamed:@"discovery_checkout_total"]];
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(630, [_lineBotImgView frame].origin.y+3+32, 72, 22)];
        [_priceLabel setTextColor:TEMP_ON_COLOR];
        [_priceLabel setFont:[UIFont systemFontOfSize:20]];
        
        
        _menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, [_TotalImgView frame].origin.y +22 +32, 381, 50)];
        [_menuButton setImage:[UIImage imageNamed:@"discovery_cjcheckout_cjmenu"] forState:UIControlStateNormal];
        [_menuButton setImage:[UIImage imageNamed:@"discovery_cjcheckout_cjmenu_pressed"] forState:UIControlStateHighlighted];
        [_menuButton addTarget:self action:@selector(onMenuBtn) forControlEvents:UIControlEventTouchUpInside];
        _payButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-381, [_TotalImgView frame].origin.y +22 +32, 381, 50)];
        [_payButton setImage:[UIImage imageNamed:@"discovery_checkout_pay"] forState:UIControlStateNormal];
        [_payButton setImage:[UIImage imageNamed:@"discovery_checkout_pay_pressed"] forState:UIControlStateHighlighted];
        [_payButton addTarget:self action:@selector(onPayBtn) forControlEvents:UIControlEventTouchUpInside];
        
        // add subview
        [self addSubview:_logoImgView];
        [self addSubview:_countLabel];
        [self addSubview:_countImgView];
        
        [self addSubview:_lineTopImgView];
        [self addSubview:_lineBotImgView];
        
        [self addSubview:_itemTableView];
        
        [self addSubview: _TotalImgView];
        [self addSubview:_priceLabel];
        
        [self addSubview:_menuButton];
        [self addSubview:_payButton];
    }
    return self;
}



- (void) loadWithItems:(NSArray*) items{
    _itemList = items;
    NSString * priceStr;
    _price = 0;
    [_countLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)[_itemList count]]];
    for( int i = 0 ; i < [_itemList count] ; i++){
        priceStr = [((OrderItemData*)[_itemList objectAtIndex:i]).itemPrice substringFromIndex:1];
        _price += (CGFloat)[priceStr floatValue];
    }
    [_priceLabel setText:[NSString stringWithFormat:@"$%.02f",_price]];
    [_itemTableView reloadData];
}


- (void) onPayBtn{
    [self.delegate onCarlPay];
}

- (void) onMenuBtn{
    [self.delegate onCarlMenu];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_itemList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CheckOutTableViewCell *cell = (CheckOutTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CheckOutCell"];
    
    OrderItemData * item = [_itemList objectAtIndex:indexPath.row];
    
    [cell loadName:item.itemName andPrice:item.itemPrice];

    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.f;
}




@end
