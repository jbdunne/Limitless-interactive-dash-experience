//
//  DIscOrderVIew.m
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import "DIscOrderVIew.h"

@implementation DIscOrderVIew

- (instancetype) initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame:frame]){
        // LOG
        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(290, 261 - TOP_UI_GAP - TOP_UI_HEIGHT, 138, 73)];
        [_logoImageView setImage:[UIImage imageNamed:@"discovery_cjmenu_logo"]];
        
        _countImageView = [[UIImageView alloc] initWithFrame:CGRectMake(674, 353 - TOP_UI_GAP - TOP_UI_HEIGHT, 64, 16)];
        [_countImageView setImage:[UIImage imageNamed:@"discovery_items"]];
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(604,  333 - TOP_UI_GAP - TOP_UI_HEIGHT, 60, 50)];
        [_countLabel setText:@"0"];
        [_countLabel setTextAlignment:NSTextAlignmentRight];
        [_countLabel setTextColor:TEMP_ON_COLOR];
        [_countLabel setFont:[UIFont systemFontOfSize:50]];
        _count = 0;
        
        // CollectionView128 × 32
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        _itemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 393 -TOP_UI_GAP - TOP_UI_HEIGHT, SCREEN_WIDTH, MID_VIEW_HEIGHT - (393 -TOP_UI_GAP - TOP_UI_HEIGHT )-50) collectionViewLayout:layout];
        [_itemCollectionView setDataSource:self];
        [_itemCollectionView setDelegate:self];
        [_itemCollectionView registerClass:[OrderCollectionViewCell class] forCellWithReuseIdentifier:@"orderCell"];
        [_itemCollectionView setBackgroundColor:[UIColor clearColor]];
        
        // Order Btn
        _orderBtn = [UIButton buttonWithType:UIButtonTypeCustom ];
        [_orderBtn setFrame:CGRectMake(0, MID_VIEW_HEIGHT- 50, SCREEN_WIDTH, 50)];
        [_orderBtn setBackgroundImage:[UIImage imageNamed:@"discovery_menu_orderbutton_pressed"] forState:UIControlStateNormal];
        [_orderBtn setBackgroundImage:[UIImage imageNamed:@"discovery_menu_orderbutton"] forState:UIControlStateHighlighted];
        [_orderBtn addTarget:self action:@selector(onOrderBtn) forControlEvents:UIControlEventTouchUpInside];

        // Data
        _isCarl = true;
        
        [self addSubview:_logoImageView];
        [self addSubview:_countImageView];
        [self addSubview:_countLabel];
        
        [self createCarlData];
        [self createCvsData];
        [self addSubview: _orderBtn];
        
        [self addSubview:_itemCollectionView];
    }
    return self;
}

- (void)loadOrderAt:(NSInteger)at{
    if( at == 0 ){
        _isCarl = true;
    }else{
        _isCarl = false;
    }
    [self updateLogo];
    _count = 0;
    [_countLabel setText:[NSString stringWithFormat:@"%li", (long)_count]];
    
    
    for (int i = 0 ; i < _carlItems.count ; i++){
        OrderItemData * item = (OrderItemData*)[_carlItems objectAtIndex:i];
        [item setIsSelected:NO];
        
    }
    
    
    
    
    
    
    [_itemCollectionView reloadData];
    
}

- (void) onOrderBtn{
    NSLog(@"[OrderView] on Order Button");
    NSMutableArray * itemsList = [[NSMutableArray alloc] init];
    if( _isCarl){
        for (int i = 0 ; i < _carlItems.count ; i++){
            OrderItemData * item = (OrderItemData*)[_carlItems objectAtIndex:i];
            if( item.isSelected){
                item.isSelected = false;
                [itemsList addObject:[[OrderItemData alloc] initWithItem:item]];
            }
            
        }
    }else{
        for (int i = 0 ; i < _cvsItems.count ; i++){
            OrderItemData * item = (OrderItemData*)[_cvsItems objectAtIndex:i];
            if( item.isSelected){
                item.isSelected = false;
                [itemsList addObject:[[OrderItemData alloc] initWithItem:item]];
            }
            
        }
    }
    [self.delegate onOrderWithItems:itemsList isCarl:_isCarl];
}


- (void) createCarlData{
    OrderItemData * item0 = [[OrderItemData alloc] init];
    [item0 setItemName:@"Bacon Swiss Crispy Chicken"];
    [item0 setItemPrice:@"$4.99"];
    [item0 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item01"]];
    [item0 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item01_selected"]];
    
    OrderItemData * item1 = [[OrderItemData alloc] init];
    [item1 setItemName:@"Western Bacon Thickburger"];
    [item1 setItemPrice:@"$5.99"];
    [item1 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item02"]];
    [item1 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item02_selected"]];
    
    OrderItemData * item2 = [[OrderItemData alloc] init];
    [item2 setItemName:@"Cod Fish Sandwich"];
    [item2 setItemPrice:@"$4.99"];
    [item2 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item03"]];
    [item2 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item03_selected"]];
    
    OrderItemData * item3 = [[OrderItemData alloc] init];
    [item3 setItemName:@"Original Siz Dollar Thickburger"];
    [item3 setItemPrice:@"$5.99"];
    [item3 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item04"]];
    [item3 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item04_selected"]];
    
    OrderItemData * item4 = [[OrderItemData alloc] init];
    [item4 setItemName:@"The Single All-Natural Burger"];
    [item4 setItemPrice:@"$6.99"];
    [item4 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item05"]];
    [item4 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item05_selected"]];
    
    OrderItemData * item5 = [[OrderItemData alloc] init];
    [item5 setItemName:@"Big Chicken Fillet Sandwich"];
    [item5 setItemPrice:@"$4.99"];
    [item5 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item06"]];
    [item5 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item06_selected"]];
    
    OrderItemData * item6 = [[OrderItemData alloc] init];
    [item6 setItemName:@"Bacon Egg & Cheese Biscuit"];
    [item6 setItemPrice:@"$3.99"];
    [item6 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item07"]];
    [item6 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item07_selected"]];
    
    OrderItemData * item7 = [[OrderItemData alloc] init];
    [item7 setItemName:@"6-Piece Chicken Stars"];
    [item7 setItemPrice:@"$3.99"];
    [item7 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item08"]];
    [item7 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item08_selected"]];
    
    OrderItemData * item8 = [[OrderItemData alloc] init];
    [item8 setItemName:@"Chicken Tenders"];
    [item8 setItemPrice:@"$4.99"];
    [item8 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item09"]];
    [item8 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item09_selected"]];
    
    OrderItemData * item9 = [[OrderItemData alloc] init];
    [item9 setItemName:@"Crispy Chicken Salad"];
    [item9 setItemPrice:@"$4.99"];
    [item9 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item10"]];
    [item9 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item10_selected"]];
    
    
    OrderItemData * item10 = [[OrderItemData alloc] init];
    [item10 setItemName:@"Garden Side Salad"];
    [item10 setItemPrice:@"$1.99"];
    [item10 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item11"]];
    [item10 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item11_selected"]];
    
    OrderItemData * item11 = [[OrderItemData alloc] init];
    [item11 setItemName:@"French Fries"];
    [item11 setItemPrice:@"$1.99"];
    [item11 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item12"]];
    [item11 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item12_selected"]];
    
    OrderItemData * item12 = [[OrderItemData alloc] init];
    [item12 setItemName:@"Strawberry Cheesecake"];
    [item12 setItemPrice:@"$0.99"];
    [item12 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item13"]];
    [item12 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item13_selected"]];
    
    OrderItemData * item13 = [[OrderItemData alloc] init];
    [item13 setItemName:@"Chocolate Chip Cookies"];
    [item13 setItemPrice:@"$0.99"];
    [item13 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item14"]];
    [item13 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item14_selected"]];
    
    OrderItemData * item14 = [[OrderItemData alloc] init];
    [item14 setItemName:@"Chocolate Cake"];
    [item14 setItemPrice:@"$0.99"];
    [item14 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item15"]];
    [item14 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item15_selected"]];
    
    OrderItemData * item15 = [[OrderItemData alloc] init];
    [item15 setItemName:@"Turkey Burger"];
    [item15 setItemPrice:@"$4.99"];
    [item15 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item16"]];
    [item15 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item16_selected"]];
    
    OrderItemData * item16 = [[OrderItemData alloc] init];
    [item16 setItemName:@"The Double All-Natural Burger"];
    [item16 setItemPrice:@"$7.99"];
    [item16 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item17"]];
    [item16 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item17_selected"]];
    
    OrderItemData * item17 = [[OrderItemData alloc] init];
    [item17 setItemName:@"Gauacamole Turkey Burger"];
    [item17 setItemPrice:@"$7.99"];
    [item17 setItemImage:[UIImage imageNamed:@"discovery_cjmenu_item18"]];
    [item17 setItemImagePressed:[UIImage imageNamed:@"discovery_cjmenu_item18_selected"]];
    
    
    _carlItems = @[item0,item1,item2,
                   item3,item4,item5,
                   item6,item7,item8,
                   
                   item9,item10,item11,
                   item12,item13,item14,
                   item15,item16,item17];
    
}

- (void) createCvsData{
    OrderItemData * item0 = [[OrderItemData alloc] init];
    [item0 setItemName:@"Thyroid Booster Capsules"];
    [item0 setItemPrice:@"$14.99"];
    [item0 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item01"]];
    [item0 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item01_selected"]];
    
    OrderItemData * item1 = [[OrderItemData alloc] init];
    [item1 setItemName:@"Black Currant Seed Oil"];
    [item1 setItemPrice:@"$11.99"];
    [item1 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item02"]];
    [item1 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item02_selected"]];
    
    OrderItemData * item2 = [[OrderItemData alloc] init];
    [item2 setItemName:@"Bio Nutrition Joint Wellness"];
    [item2 setItemPrice:@"$9.99"];
    [item2 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item03"]];
    [item2 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item03_selected"]];
    
    OrderItemData * item3 = [[OrderItemData alloc] init];
    [item3 setItemName:@"Berocca Orange Flavor"];
    [item3 setItemPrice:@"$5.99"];
    [item3 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item04"]];
    [item3 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item04_selected"]];
    
    OrderItemData * item4 = [[OrderItemData alloc] init];
    [item4 setItemName:@"Mixed Berry Soft Chews"];
    [item4 setItemPrice:@"$6.99"];
    [item4 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item05"]];
    [item4 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item05_selected"]];
    
    OrderItemData * item5 = [[OrderItemData alloc] init];
    [item5 setItemName:@"CVS Vision Formula Tablets"];
    [item5 setItemPrice:@"$4.99"];
    [item5 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item06"]];
    [item5 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item06_selected"]];
    
    OrderItemData * item6 = [[OrderItemData alloc] init];
    [item6 setItemName:@"Evening Primrose Oil"];
    [item6 setItemPrice:@"$5.99"];
    [item6 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item07"]];
    [item6 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item07_selected"]];
    
    OrderItemData * item7 = [[OrderItemData alloc] init];
    [item7 setItemName:@"Apple Cider Vinegar Tablets"];
    [item7 setItemPrice:@"$9.99"];
    [item7 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item08"]];
    [item7 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item08_selected"]];
    
    OrderItemData * item8 = [[OrderItemData alloc] init];
    [item8 setItemName:@"Black Seed Cold-Pressed Oil"];
    [item8 setItemPrice:@"$14.99"];
    [item8 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item09"]];
    [item8 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item09_selected"]];
    
    OrderItemData * item9 = [[OrderItemData alloc] init];
    [item9 setItemName:@"CVS Herbal Milk Thistle"];
    [item9 setItemPrice:@"$20.99"];
    [item9 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item10"]];
    [item9 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item10_selected"]];
    
    
    OrderItemData * item10 = [[OrderItemData alloc] init];
    [item10 setItemName:@"Nature made Milk Thistle"];
    [item10 setItemPrice:@"$12.99"];
    [item10 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item11"]];
    [item10 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item11_selected"]];
    
    OrderItemData * item11 = [[OrderItemData alloc] init];
    [item11 setItemName:@"CVS Baby Lotion"];
    [item11 setItemPrice:@"$3.99"];
    [item11 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item12"]];
    [item11 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item12_selected"]];
    
    OrderItemData * item12 = [[OrderItemData alloc] init];
    [item12 setItemName:@"Aveeno Baby Mositure Lotion"];
    [item12 setItemPrice:@"$5.99"];
    [item12 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item13"]];
    [item12 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item13_selected"]];
    
    OrderItemData * item13 = [[OrderItemData alloc] init];
    [item13 setItemName:@"BabyGanics Sunscreen"];
    [item13 setItemPrice:@"$4.99"];
    [item13 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item14"]];
    [item13 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item14_selected"]];
    
    OrderItemData * item14 = [[OrderItemData alloc] init];
    [item14 setItemName:@"Bentley Baby Nappy Balm"];
    [item14 setItemPrice:@"$8.99"];
    [item14 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item15"]];
    [item14 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item15_selected"]];
    
    OrderItemData * item15 = [[OrderItemData alloc] init];
    [item15 setItemName:@"Advil Caplets"];
    [item15 setItemPrice:@"$7.99"];
    [item15 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item16"]];
    [item15 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item16_selected"]];
    
    OrderItemData * item16 = [[OrderItemData alloc] init];
    [item16 setItemName:@"Aleve Tablets"];
    [item16 setItemPrice:@"$7.99"];
    [item16 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item17"]];
    [item16 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item17_selected"]];
    
    OrderItemData * item17 = [[OrderItemData alloc] init];
    [item17 setItemName:@"Herbal Clean Emu Oil Cream"];
    [item17 setItemPrice:@"$7.99"];
    [item17 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item18"]];
    [item17 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item18_selected"]];
    
    OrderItemData * item18 = [[OrderItemData alloc] init];
    [item18 setItemName:@"CVS Digital Body Scale"];
    [item18 setItemPrice:@"$3.99"];
    [item18 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item19"]];
    [item18 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item19_selected"]];
    
    OrderItemData * item19 = [[OrderItemData alloc] init];
    [item19 setItemName:@"Nutritional Liquid Shake"];
    [item19 setItemPrice:@"$4.99"];
    [item19 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item20"]];
    [item19 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item20_selected"]];
    
    OrderItemData * item20 = [[OrderItemData alloc] init];
    [item20 setItemName:@"5 Hour Energy Shot"];
    [item20 setItemPrice:@"$3.99"];
    [item20 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item21"]];
    [item20 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item21_selected"]];
    
    OrderItemData * item21 = [[OrderItemData alloc] init];
    [item21 setItemName:@"Ovega-3 Vegetarian Softgels"];
    [item21 setItemPrice:@"$26.99"];
    [item21 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item22"]];
    [item21 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item22_selected"]];
    
    OrderItemData * item22 = [[OrderItemData alloc] init];
    [item22 setItemName:@"Heart and Circulatory Capsules"];
    [item22 setItemPrice:@"$8.99"];
    [item22 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item23"]];
    [item22 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item23_selected"]];
    
    OrderItemData * item23 = [[OrderItemData alloc] init];
    [item23 setItemName:@"Super Melatonin"];
    [item23 setItemPrice:@"$7.99"];
    [item23 setItemImage:[UIImage imageNamed:@"discovery_cvsmenu_item24"]];
    [item23 setItemImagePressed:[UIImage imageNamed:@"discovery_cvsmenu_item24_selected"]];
    
    
    _cvsItems = @[item0,item1,item2,
                   item3,item4,item5,
                   item6,item7,item8,
                   
                   item9,item10,item11,
                   item12,item13,item14,
                   item15,item16,item17,
                   
                   item18,item19,item20,
                   item21,item22,item23];
}

- (void) updateLogo{
    if( _isCarl){
        [_logoImageView setFrame:CGRectMake(290, 261 - TOP_UI_GAP - TOP_UI_HEIGHT, 138, 73)];
        [_logoImageView setImage:[UIImage imageNamed:@"discovery_cjmenu_logo"]];
    }else{
        [_logoImageView setFrame:CGRectMake(287, 276 - TOP_UI_HEIGHT-TOP_UI_GAP, 188, 73)];
        [_logoImageView setImage:[UIImage imageNamed:@"discovery_cvs_logo"]];
    }
}





#pragma mark - UICollectionViewDataSourceDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if( _isCarl)
        return 18;
    else
        return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    OrderCollectionViewCell * orderCell = (OrderCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"orderCell" forIndexPath:indexPath];

    if( _isCarl){
        [orderCell applyOrderItem:(OrderItemData*)[_carlItems objectAtIndex:indexPath.row]];
    }else{
        [orderCell applyOrderItem:(OrderItemData*)[_cvsItems objectAtIndex:indexPath.row]];
    }
    return orderCell;
}

#pragma mark - UICollectionViewDelagate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    OrderItemData * orderData;
    if( _isCarl )
        orderData = (OrderItemData*)[_carlItems objectAtIndex:indexPath.row];
    else
        orderData = (OrderItemData*)[_cvsItems objectAtIndex:indexPath.row];
    if( [orderData isSelected]){
        _count--;
        [_countLabel setText:[NSString stringWithFormat:@"%ld",(long)_count]];
    }else{
        _count++;
        [_countLabel setText:[NSString stringWithFormat:@"%ld",(long)_count]];
    }
    [orderData setIsSelected:![orderData isSelected]];
    [collectionView reloadData];
    
}



#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(256, 163);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0,0, 0, 0);  // top, left, bottom, right
}

@end
