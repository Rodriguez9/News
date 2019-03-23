//
//  MyOtherCell.swift
//  News
//
//  Created by YZH on 2019/3/13.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell,RegisterCellOrNib {
    
    //标题
    @IBOutlet weak var leftLabel: UILabel!
    //副标题
    @IBOutlet weak var rightLabel: UILabel!
    //右边箭头
    @IBOutlet weak var rightImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
