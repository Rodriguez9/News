//
//  SettingCell.swift
//  News
//
//  Created by YZH on 2019/6/6.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell,RegisterCellOrNib {

    var setting : SettingModel? {
        didSet {
            titleLabel.text = setting!.title
            subtitleLabel.text = setting!.subtitle
            rightTitleLabel.text = setting!.rightTitle
            arrowImageView.isHidden = setting!.isHiddenRightArraw
            switchView.isHidden = setting!.isHiddenSwitch
            if !setting!.isHiddenSubtitle {
                subtitleLabelHeight.constant = 20
                layoutIfNeeded()
            }
        }
    }
    
    @IBOutlet weak var subtitleLabelHeight: NSLayoutConstraint!
    
    //标题
    @IBOutlet weak var titleLabel: UILabel!
    
    //副标题
    @IBOutlet weak var subtitleLabel: UILabel!
    
    //右边标题
    @IBOutlet weak var rightTitleLabel: UILabel!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var switchView: UISwitch!
    
    @IBOutlet weak var bottomLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        theme_backgroundColor = "colors.cellBackgroundColor"
        bottomLine.theme_backgroundColor = "colors.separatorViewColor"
        titleLabel.theme_textColor = "colors.black"
        rightTitleLabel.theme_textColor = "colors.cellRightTextColor"
        arrowImageView.theme_image = "images.cellRightArrow"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
