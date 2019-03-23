//
//  UIColor+Extension.swift
//  News
//
//  Created by YZH on 2019/2/26.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
extension UIColor{
    
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1.0) {
        self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    class func globalBackgroundColor() -> UIColor{
        return UIColor(r: 248, g: 249, b: 247)
    }
}
