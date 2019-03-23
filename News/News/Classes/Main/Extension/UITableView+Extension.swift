//
//  UITableView+Extension.swift
//  News
//
//  Created by YZH on 2019/3/22.
//  Copyright © 2019年 YZH. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    
    //注册cell的方法
    func ym_registerCell<T:UITableViewCell>(cell:T.Type) where T :RegisterCellOrNib{
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    //从缓存池去除已经存在的cell
    func ym_dequeueReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T: RegisterCellOrNib{
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
}
