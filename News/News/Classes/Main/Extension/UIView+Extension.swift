//
//  UIView+Extension.swift
//  News
//
//  Created by YZH on 2019/3/22.
//  Copyright © 2019年 YZH. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterCellOrNib {}

extension RegisterCellOrNib{
    
    static var identifier:String {
        return "\(self)"
    }
    
    static var nib:UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
}
