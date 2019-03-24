//
//  NoLoginHeaderView.swift
//  News
//
//  Created by YZH on 2019/3/24.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import IBAnimatable
import SwiftTheme
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
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    class func headerView() -> NoLoginHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! NoLoginHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle)
        let effectX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effectX.maximumRelativeValue = 20
        effectX.minimumRelativeValue = -20
        stackView.addMotionEffect(effectX)
        ///设置主题
        mobileButton.theme_setImage("images.loginMobileButton", forState: .normal)
        wechatButton.theme_setImage("images.loginWechatButton", forState: .normal)
        qqButton.theme_setImage("images.loginQQButton", forState: .normal)
        sinaButton.theme_setImage("images.loginSinaButton", forState: .normal)
        favorityButton.theme_setImage("images.mineFavoriteButton", forState: .normal)
        historyButton.theme_setImage("images.mineHistoryButton", forState: .normal)
        dayOrNightButton.theme_setImage("images.dayOrNightButton", forState: .normal)
        dayOrNightButton.setTitle("夜间", for: .normal)
        dayOrNightButton.setTitle("日间", for: .selected)
        moreLoginButton.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        moreLoginButton.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        favorityButton.theme_setTitleColor("colors.black", forState: .normal)
        historyButton.theme_setTitleColor("colors.black", forState: .normal)
        dayOrNightButton.theme_setTitleColor("colors.black", forState: .normal)
        bottomView.theme_backgroundColor = "colors.cellBackgroundColor"
    }
    
    ///点击了日间夜间按钮
    @IBAction func dayOrNightButtonClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        UserDefaults.standard.set(sender.isSelected, forKey: isNight)
        MyTheme.switchNight(sender.isSelected)
    }
}
