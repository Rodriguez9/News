//
//  MyOtherCell.swift
//  News
//
//  Created by YZH on 2019/3/13.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell,RegisterCellOrNib {
    
    @IBOutlet weak var separatorView: UIView!
    //标题
    @IBOutlet weak var leftLabel: UILabel!
    //副标题
    @IBOutlet weak var rightLabel: UILabel!
    //右边箭头
    @IBOutlet weak var rightImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ///设置主题
        leftLabel.theme_textColor = "colors.black"
        rightLabel.theme_textColor = "colors.cellRightTextColor"
        rightImageView.theme_image = "images.cellRightArrow"
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        theme_backgroundColor = "colors.cellBackgroundColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
