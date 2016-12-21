//
//  GWTabBar.h
//  GWTabBarController
//
//  Created by 杨根威 on 2016/12/20.
//  Copyright © 2016年 yanggenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GWTabBarButton.h"
@class GWTabBar;
@protocol GWTabBarDelegate<NSObject>

/**
 实现切换页面

 @param tabBar tabBar对象
 @param oldIndex 曾经选中的按钮
 @param newIndex 当前选中的按钮
 */
- (void)tabBar:(GWTabBar *)tabBar didSelectItemFormIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex;

@end

@interface GWTabBar : UIView
//代理
@property (nonatomic,readwrite,weak)id<GWTabBarDelegate> delegate;
//设定当前选中的按钮
@property (nonatomic,readwrite,unsafe_unretained)GWTabBarButton   *selectButton;
/**
 添加一个按钮

 @param tabBarButton 按钮
 */
- (void)addTabBarItem:(UITabBarItem *)tabBarButton;

@end
