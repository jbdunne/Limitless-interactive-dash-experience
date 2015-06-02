//
//  DIscOrderVIew.h
//  IPG_osx_ios
//
//  Created by Gene Han on 5/17/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
#import "OrderCollectionViewCell.h"
#import "OrderItemData.h"


@protocol DIscOrderVIewDelegate <NSObject>

- (void) onOrderWithItems:(NSArray*) items isCarl:(BOOL)isCarl;

@end

@interface DIscOrderVIew : UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

// LOGO
@property (strong, nonatomic) UIImageView * logoImageView;
@property (strong, nonatomic) UIImageView * countImageView;
@property (strong, nonatomic) UILabel * countLabel;
@property (assign, nonatomic) NSInteger count;

@property (strong, nonatomic) UIImageView * orderLogoImageView;
@property (strong, nonatomic) UICollectionView * itemCollectionView;
@property (strong, nonatomic) UIButton * orderBtn;

- (void) loadOrderAt:(NSInteger) at;

// RESET



// DATA
@property (assign, nonatomic) BOOL isCarl;
@property (strong, nonatomic) NSArray * carlItems;
@property (strong, nonatomic) NSArray * cvsItems;

// Delegate

@property (weak, nonatomic) id delegate;


@end
