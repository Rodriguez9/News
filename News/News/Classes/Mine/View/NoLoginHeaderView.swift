//
//  NoLoginHeaderView.swift
//  News
//
//  Created by YZH on 2019/3/24.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import IBAnimatable
class NoLoginHeaderView: UIView {
    ///背景图片
    @IBOutlet weak var bgImageView: UIImageView!
    ///手机按钮
    @IBOutlet weak var mobileButton: UIButton!
    ///微信按钮
    @IBOutlet weak var wechatButton: UIButton!
    ///QQ按钮
    @IBOutlet weak var qqButton: UIButton!
    ///新浪按钮
    @IBOutlet weak var sinaButton: UIButton!
    ///更多登陆方式
    @IBOutlet weak var moreLoginButton: AnimatableButton!
    ///收藏按钮
    @IBOutlet weak var favorityButton: UIButton!
    ///历史按钮
    @IBOutlet weak var historyButton: UIButton!
    ///日间按钮
    @IBOutlet weak var dayOrNightButton: UIButton!
    
    class func headerView() -> NoLoginHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! NoLoginHeaderView
    }
}
