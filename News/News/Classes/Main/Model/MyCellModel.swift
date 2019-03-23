//
//  MyCellModel.swift
//  News
//
//  Created by YZH on 2019/3/8.
//  Copyright © 2019年 YZH. All rights reserved.
//

import Foundation
import HandyJSON

struct MyCellModel : HandyJSON{
    var text : String = ""
    var grey_text : String = ""
    var url : String = ""
    var key : String = ""
    var tip_new : Int = 0
}

struct MyConcern :  HandyJSON{
    var name: String = ""
    var url: String = ""
    var total_count: Int = 0
    var description: String = ""
    var time: String = ""
    var type: String = ""
    var icon: String = ""
    var userid: Int = 0
    var is_verify: Bool = false
    var media_id: Int = 0
    var tips: Bool = false
    var id: Int = 0
    var user_auth_info : String? = ""
    var userAuthInfo : UserAuthInfo?{
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
    
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int = 0
    var auth_info: String = ""
}
