//
//  GWTabBar.m
//  GWTabBarController
//
//  Created by 杨根威 on 2016/12/20.
//  Copyright © 2016年 yanggenwei. All rights reserved.
//

#import "GWTabBar.h"
@interface GWTabBar()

@end

@implementation GWTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setAlpha:0.7];
    }
    return  self;
}

#pragma mark 初始化tabBar
- (void)addTabBarItem:(UITabBarItem *)tabBarItem{
    
    GWTabBarButton *tabBarButton = [[GWTabBarButton alloc]initWithTabBarItem:tabBarItem];
    
    [tabBarButton addTarget:self
                     action:@selector(tabBarButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:tabBarButton];
}


#pragma mark 跳转页面设置
- (void)tabBarButtonAction:(GWTabBarButton *) tabBarButton{
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectItemFormIndex:toIndex:)]){
        
        [self.delegate tabBar:self didSelectItemFormIndex:self.selectButton.tag toIndex:tabBarButton.tag];
    }
    //重新设置按钮的选中状态
    self.selectButton.selected = NO;
    //由于点击该方法后,表明已经切换了按钮对象,所以之前的按钮对象需要放弃,重新指定按钮对象
    self.selectButton = tabBarButton;
    self.selectButton.selected = YES;
}

#pragma mark 设置按钮位置和绑定tag
- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (NSInteger index = 0;index<self.subviews.count;index++){
        //从之前添加的子视图列表中获取按钮对象
        GWTabBarButton *tabBtn = self.subviews[index];
        //设定按钮布局,实现平均排列
        tabBtn.frame = CGRectMake(index*self.frame.size.width/self.subviews.count, 2, self.frame.size.width/self.subviews.count, tabBarHeight);
        tabBtn.titleLabel.font = [UIFont systemFontOfSize:GWTabBarFontSize];
        
        //设定图标和标题偏移,实现图上字下的布局方式
        CGSize btnImageBounds = tabBtn.imageView.bounds.size;
        CGSize btnTitleBounds = tabBtn.titleLabel.bounds.size;
        tabBtn.titleEdgeInsets = UIEdgeInsetsMake(0.0, -btnImageBounds.width/2, - btnImageBounds.height, btnImageBounds.width/2);
        tabBtn.imageEdgeInsets = UIEdgeInsetsMake(-btnTitleBounds.height-5,btnTitleBounds.width/2, 0.0, -btnTitleBounds.width/2);

        //绑定tag,便于tabBar代理方法的实现
        tabBtn.tag = index;
    }
}


@end
