//
//  MyTabBar.swift
//  News
//
//  Created by YZH on 2019/2/17.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        theme_tintColor = "colors.tabbarTintColor"
        theme_barTintColor = "colors.cellBackgroundColor"
        addSubview(publishButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var publishButton : UIButton = {
        let publishButton = UIButton(type: .custom)
        publishButton.theme_setImage("images.publishButtonBackgroundImage", forState: .normal)
        publishButton.theme_setImage("images.publishButtonBackgroundSelectImage", forState: .selected)
        publishButton.sizeToFit()
        return publishButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //当前tabbar的高度和宽度
        let width = frame.width
        let height : CGFloat = 49
        
        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.5-7)
        //设置其他按钮的frame
        let buttonW : CGFloat = width * 0.2
        let buttonH : CGFloat = height
        let buttonY : CGFloat = 0
        
        var  index = 0
        
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){continue}
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            index += 1
        }
        
    }
    
}
