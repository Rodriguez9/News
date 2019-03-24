//
//  MyConcernCell.swift
//  News
//
//  Created by YZH on 2019/3/24.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Kingfisher

class MyConcernCell: UICollectionViewCell,RegisterCellOrNib {

    //头像
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var viptarImageView: UIImageView!
    
    //用户名
    @IBOutlet weak var nameLabel: UILabel!
   //新通知
    @IBOutlet weak var tipButton: UIButton!
    
    var MyConcern : MyConcern?{
        didSet{
            avatarImageView.kf.setImage(with: URL(string: (MyConcern?.icon)!))
            nameLabel.text = MyConcern?.name
            if let isVerify = MyConcern?.is_verify {
                viptarImageView.isHidden = !isVerify
            }
            if let tips = MyConcern?.tips {
                tipButton.isHidden = !tips
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tipButton.layer.borderWidth = 1
        tipButton.layer.borderColor = UIColor.white.cgColor
        theme_backgroundColor = "colors.cellBackgroundColor"
        nameLabel.theme_textColor = "colors.black"
    }

}
