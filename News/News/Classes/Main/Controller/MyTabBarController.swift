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
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: "dayOrNightButtonClick"), object: nil)
    }
    
    ///接受到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification:Notification){
        let selected = notification.object as! Bool
        if selected {//设置为夜间
            for childController in childViewControllers{
                switch childController.title! {
                case "首页":
                    setNightChildController(controller: childController, imageName: "home")
                case "视频":
                    setNightChildController(controller: childController, imageName: "video")
                case "小视频":
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "未登录":
                    setNightChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        }else{//设置为日间
            for childController in childViewControllers{
                switch childController.title! {
                case "首页":
                    setDayChildController(controller: childController, imageName: "home")
                case "视频":
                    setDayChildController(controller: childController, imageName: "video")
                case "小视频":
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "未登录":
                    setDayChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        }
    }
    
    ///设置夜间控制器
    private func setNightChildController(controller : UIViewController , imageName : String){
        controller.tabBarItem.image = UIImage.init(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage.init(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    ///设置日间控制器
    private func setDayChildController(controller : UIViewController , imageName : String){
        controller.tabBarItem.image = UIImage.init(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage.init(named: imageName + "_tabbar_press_32x32_")
    }
    
    //添加子控制器
    private func addchildViewController() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home")
        setChildViewController(VideoViewController(), title: "视频", imageName: "video")
        setChildViewController(HuoshanViewController(), title: "火山", imageName: "huoshan")
        setChildViewController(MineViewController(), title: "未登录", imageName: "no_login")
        //tabBar是readOnly属性，不能直接修改，利用KVC吧readonly属性权限修改
        setValue(MyTabBar(), forKey: "tabBar")
    }
    
    //初始化子控制器
    private func setChildViewController(_ childController: UIViewController,title:String,imageName:String) {
        //设置tabbar文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        }else{
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        //添加导航控制器为TabBarController的子控制器
        let navVc = MyNavigationController(rootViewController: childController)
        addChildViewController(navVc)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
