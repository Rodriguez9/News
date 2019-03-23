//
//  MyTabBarController.swift
//  News
//
//  Created by YZH on 2019/2/17.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
        
        //添加子控制器
        addchildViewController()
    }
    
    func addchildViewController() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectImageNAme: "home_tabbar_press_32x32_")
        setChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectImageNAme: "video_tabbar_press_32x32_")
        setChildViewController(HuoshanViewController(), title: "火山", imageName: "huoshan_tabbar_32x32_", selectImageNAme: "huoshan_tabbar_press_32x32_")
        setChildViewController(MineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectImageNAme: "mine_tabbar_press_32x32_")
        //利用KVC吧readonly属性权限修改
        setValue(MyTabBar(), forKey: "tabBar")
    }
    
    //初始化子控制器
    func setChildViewController(_ childController: UIViewController,title:String,imageName:String,selectImageNAme:String) {
        //设置tabbar文字和图片
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectImageNAme)
        childController.title = title
        //添加导航控制器为TabBarController的子控制器
        let navVc = MyNavigationController(rootViewController: childController)
        addChildViewController(navVc)
    }
}
