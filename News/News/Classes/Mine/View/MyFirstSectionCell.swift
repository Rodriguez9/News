//
//  MyFirstSectionCell.swift
//  News
//
//  Created by YZH on 2019/3/13.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class MyFirstSectionCell: UITableViewCell,RegisterCellOrNib {

    //标题
    @IBOutlet weak var leftLabel: UILabel!
    //副标题
    @IBOutlet weak var rightLabel: UILabel!
    //右边箭头
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    ///分割线
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var topView: UIView!
    var myCocerns = [MyConcern](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    var myCellModel : MyCellModel? {
        didSet{
            leftLabel.text = myCellModel?.text
            rightLabel.text = myCellModel?.grey_text
        }
    }
    
    var myConcern:MyConcern? {
        didSet{
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = MyConcernFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.ym_registerCell(cell: MyConcernCell.self)
        ///设置主题
        leftLabel.theme_textColor = "colors.black"
        rightLabel.theme_textColor = "colors.cellRightTextColor"
        rightImageView.theme_image = "images.cellRightArrow"
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        theme_backgroundColor = "colors.cellBackgroundColor"
        topView.theme_backgroundColor = "colors.cellBackgroundColor"
        collectionView.theme_backgroundColor = "colors.cellBackgroundColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        //每个cell的大小
        itemSize = CGSize(width: 58, height: 74)
        //横向间距
        minimumLineSpacing = 0
        //纵向间距
        minimumInteritemSpacing = 0
        //cell上下左右的间距
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        //设置水平滚动
        scrollDirection = .horizontal
    }
}

extension MyFirstSectionCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCocerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ym_dequeueReusableCell(indexPath: indexPath) as MyConcernCell
        cell.MyConcern = myCocerns[indexPath.item]
        return cell
    }
    
    
    
}
