//
//  GWTabBarButton.m
//  GWTabBarController
//
//  Created by 杨根威 on 2016/12/20.
//  Copyright © 2016年 yanggenwei. All rights reserved.
//

#import "GWTabBarButton.h"

@implementation GWTabBarButton

#pragma mark 初始化按钮
- (instancetype)initWithTabBarItem:(UITabBarItem *)tabBarItem{
    if(self = [super init])
    {
        [self setTitle:tabBarItem.title forState:UIControlStateNormal];
        [self setImage:tabBarItem.image forState:UIControlStateNormal];
        [self setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    }
    return self;
}

@end
