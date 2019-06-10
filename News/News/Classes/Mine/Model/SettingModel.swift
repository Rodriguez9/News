//
//  SettingModel.swift
//  News
//
//  Created by YZH on 2019/6/6.
//  Copyright © 2019年 YZH. All rights reserved.
//

import Foundation
import HandyJSON

struct SettingModel : HandyJSON{
    
    var title : String = ""
    var subtitle : String = ""
    var rightTitle : String = ""
    var isHiddenRightTitle : Bool = false
    var isHiddenSubtitle : Bool = false
    var isHiddenRightArraw : Bool = false
    var isHiddenSwitch : Bool = false
    
}
