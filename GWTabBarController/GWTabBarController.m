//
//  GWTabBarController.m
//  GWTabBarController
//
//  Created by 杨根威 on 2016/12/20.
//  Copyright © 2016年 yanggenwei. All rights reserved.
//

#import "GWTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface GWTabBarController ()
@property (nonatomic,readwrite,strong)GWTabBar  *gwTabBar;
@end

@implementation GWTabBarController

#pragma mark 移除自带的tabBar
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for(UIView *child in self.tabBar.subviews){
        if([child isKindOfClass:[UIControl class]]){
            [child removeFromSuperview];
        }
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initlizeTabBar];
    
    [self initializeAllControllers];
    
    //设定默认启动第一页
    self.gwTabBar.selectButton = self.gwTabBar.subviews[0];
    self.gwTabBar.selectButton.selected = YES;
}

#pragma mark 初始化自定义tabBar
- (void)initlizeTabBar{
    
    //移除自带的tabBar
    CGRect rect = self.tabBar.frame;
    rect.origin.y = FRAMEHEIGHT - tabBarHeight;
    rect.size.height = tabBarHeight;
    [self.tabBar removeFromSuperview];
    
    self.gwTabBar = [[GWTabBar alloc] initWithFrame:rect];
    self.gwTabBar.delegate = self;
    [self.view addSubview:self.gwTabBar];
    
}

#pragma mark 实现点击切换页面
- (void)tabBar:(GWTabBar *)tabBar didSelectItemFormIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex
{
    self.selectedIndex = newIndex;
}


#pragma mark 为TabBar初始化页面
- (void)initializeAllControllers{
    
    [self setTabBarItemWithController:[FirstViewController new] title:@"第一页" defaultImageName:@"camera_n" selectedImageName:@"camera_s"];
    
    [self setTabBarItemWithController:[SecondViewController new] title:@"第二页" defaultImageName:@"camera_n" selectedImageName:@"camera_s"];
    
    [self setTabBarItemWithController:[ThirdViewController new] title:@"第三页" defaultImageName:@"camera_n" selectedImageName:@"camera_s"];
    
    [self setTabBarItemWithController:[FourthViewController new] title:@"第四页" defaultImageName:@"camera_n" selectedImageName:@"camera_s"];
    
}


/**
 将页面添加到TabBar中

 @param controller 页面控制器
 @param title 标题
 @param defaultName 默认状态图标
 @param selectedName 选中状态图标
 */
- (void)setTabBarItemWithController:(UIViewController *)controller
                              title:(NSString *)title
                       defaultImageName:(NSString *)defaultName
                  selectedImageName:(NSString *)selectedName{
    //设置tabBarItem
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:defaultName] selectedImage:[UIImage imageNamed:selectedName]];
    controller.tabBarItem = tabBarItem;
    
    //将页面加载到TabBar中
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
    
    //将tabBarItem传入到TabBar中
    [self.gwTabBar addTabBarItem:tabBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
