//
//  MoreLoginViewController.swift
//  News
//
//  Created by YZH on 2019/4/9.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import IBAnimatable
class MoreLoginViewController: AnimatableModalViewController {
    
    @IBOutlet weak var loginCloseButton: UIButton!
    //手机号view
    @IBOutlet weak var mobileView: AnimatableView!
    
    //验证码view
    @IBOutlet weak var passwordView: AnimatableView!
    
    //发送验证码view
    @IBOutlet weak var sendVerifyView: UIView!
    
    //找回密码view
    @IBOutlet weak var findPasswordView: UIView!
    
    //发送验证码按钮
    @IBOutlet weak var sendVerifyButton: UIButton!
    
    //手机号输入框
    @IBOutlet weak var mobileTextField: UITextField!
    
    //找回密码按钮
    @IBOutlet weak var findPasswordButton: UIButton!
    
    //密码输入框
    @IBOutlet weak var passwordtextField: UITextField!
    
    //未注册
    @IBOutlet weak var middleTipLabel: UILabel!
    
    //进入头条
    @IBOutlet weak var enterTouTiaoButton: AnimatableButton!
    
    //阅读条款
    @IBOutlet weak var readLabel: UILabel!
    
    //阅读按钮
    @IBOutlet weak var readButton: UIButton!
    
    //账号密码登录
    @IBOutlet weak var loginModeButton: UIButton!
    
    @IBOutlet weak var wechatLoginButton: UIButton!
    
    @IBOutlet weak var QQLoginButton: UIButton!
    
    @IBOutlet weak var tianyiLoginButton: UIButton!
    
    @IBOutlet weak var mailLoginButton: UIButton!
    
    @IBOutlet weak var topLabel: UILabel!
    
    
    //账号密码登录，点击
    @IBAction func loginModeButtonClick(_ sender: UIButton) {
        loginModeButton.isSelected = !sender.isSelected
        sendVerifyView.isHidden = sender.isSelected
        findPasswordView.isHidden = !sender.isSelected
        middleTipLabel.isHidden = sender.isSelected
        passwordtextField.placeholder = sender.isSelected ? "密码" : "请输入验证码"
        topLabel.text = sender.isSelected ? "账号密码登录" : "登陆你的头条，精彩永不消失"
    }
    
    
    @IBAction func moreLoginColseButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginModeButton.setTitle("免密码登录", for: .selected)
        view.theme_backgroundColor = "colors.cellBackgroundColor"
        topLabel.theme_textColor = "colors.black"
        middleTipLabel.theme_textColor = "colors.cellRightTextColor"
        readLabel.theme_textColor = "colors.black"
        enterTouTiaoButton.theme_backgroundColor = "colors.enterToutiaoBackgroundColor"
        enterTouTiaoButton.theme_setTitleColor("colors.enterToutiaoTextColor", forState: .normal)
        readButton.theme_setImage("images.loginReadButton", forState: .selected)
        readButton.theme_setImage("images.loginReadButtonSelected", forState: .normal)
        mobileView.theme_backgroundColor = "colors.loginMobileViewBackgroundColor"
        passwordView.theme_backgroundColor = "colors.loginMobileViewBackgroundColor"
        loginCloseButton.theme_setImage("images.loginCloseButtonImage", forState: .normal)
        wechatLoginButton.theme_setImage("images.moreLoginWechatButton", forState: .normal)
        QQLoginButton.theme_setImage("images.moreLoginQQButton", forState: .normal)
        tianyiLoginButton.theme_setImage("images.moreLoginTianyiButton", forState: .normal)
        mailLoginButton.theme_setImage("images.moreLoginMailButton", forState: .normal)
    }

    @IBAction func readButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
