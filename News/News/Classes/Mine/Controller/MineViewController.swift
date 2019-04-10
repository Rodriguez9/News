//
//  MineViewController.swift
//  News
//
//  Created by YZH on 2019/2/17.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import HandyJSON
import RxCocoa
import RxSwift
class MineViewController : UITableViewController {
    fileprivate let disposeBag = DisposeBag()
    //一定不为空，否则返回数据会奔溃
    var sections = [[MyCellModel]]()
    var concerns = [MyConcern]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.separatorStyle = .none
        tableView.ym_registerCell(cell: MyFirstSectionCell.self)
        tableView.ym_registerCell(cell: MyOtherCell.self)
        //获取cell的数据
        NetworkTool.loadMyCellData { (sections) in
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var myConcerns = [MyCellModel]()
            myConcerns.append(myConcern!)
            self.sections.append(myConcerns)
            self.sections += sections
            self.tableView.reloadData()
            NetworkTool.loadMyConcern(completionHandler: { (concerns) in
                self.concerns = concerns
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            })
        }
        headerView.moreLoginButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                let storyboard = UIStoryboard(name: String(describing: MoreLoginViewController.self), bundle: nil)
                let moreLoginVC = storyboard.instantiateViewController(withIdentifier: String(describing: MoreLoginViewController.self)) as! MoreLoginViewController
                moreLoginVC.modalSize = (width: .full, height: .custom(size: Float(screenHeight - (isIPhoneX ? 44 : 20))))
                self!.present(moreLoginVC, animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
    }
    
    fileprivate lazy var headerView : NoLoginHeaderView = {
        let headerView = NoLoginHeaderView.headerView()
        //Bundle.main.loadNibNamed("NoLoginHeaderView", owner: self, options: nil)?.last as! NoLoginHeaderView//
        return headerView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}

extension MineViewController{
    
    //每组头部的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 1 : 10
    }
    
    //返回行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (concerns.count == 0 || concerns.count == 1) ? 40 : 114
        }
        return 40
    }
    
    //返回tableview的view，每组头部的视图
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        view.backgroundColor = UIColor.globalBackgroundColor()
        return view
    }
    
    //组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    //每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MyFirstSectionCell
            let section = sections[indexPath.section]
            //row第几行
            cell.myCellModel = section[indexPath.row]
            if concerns.count == 0 || concerns.count == 1 {
                cell.collectionView.isHidden = true
            }
            if concerns.count == 1{
                cell.myConcern = concerns[0]
            }
            if concerns.count > 1{
                cell.myCocerns = concerns
            }
            return cell
        }
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MyOtherCell
        //section第几分区
        let section = sections[indexPath.section]
        //row第几行
        let myCellModel = section[indexPath.row]
        cell.leftLabel.text = myCellModel.text
        cell.rightLabel.text = myCellModel.grey_text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            let totalOffset = kMyHeaderViewHeight + abs(offsetY)
            let f = totalOffset / kMyHeaderViewHeight
            headerView.bgImageView.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
        }
    }
    
}
