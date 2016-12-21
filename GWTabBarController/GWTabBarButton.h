//
//  GWTabBarButton.h
//  GWTabBarController
//
//  Created by 杨根威 on 2016/12/20.
//  Copyright © 2016年 yanggenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWTabBarButton : UIButton

/**
 根据UITabBarItem属性进行初始化

 @param tabBarItem tabBarItem对象
 @return GWTabBarButton对象
 */
- (instancetype)initWithTabBarItem:(UITabBarItem *)tabBarItem;


@end
