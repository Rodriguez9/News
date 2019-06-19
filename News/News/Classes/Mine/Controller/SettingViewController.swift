//
//  TableViewController.swift
//  News
//
//  Created by YZH on 2019/6/5.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Kingfisher

class SettingViewController: UITableViewController {

    //存储plist文件中的数据
    var sections = [[SettingModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //从沙河中获取缓存数据大小
        calculateDiskCashSize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = sections[section]
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as SettingCell
        let rows = sections[indexPath.section]
        cell.setting = rows[indexPath.row]
        switch indexPath.section {
        case 0:
            switch indexPath.row{
            case 0: //清理缓存
                NotificationCenter.default.addObserver(self, selector: #selector(loadCacheSize), name: NSNotification.Name(rawValue:"cacheSizeM"), object: nil)
                break
            case 1://设置字体大小
                 NotificationCenter.default.addObserver(self, selector: #selector(changFontSize), name: NSNotification.Name(rawValue:"fontSize"), object: nil)
                break
            case 2://摘要
                cell.selectionStyle = .none
            case 3://非wifi网路流量
                 NotificationCenter.default.addObserver(self, selector: #selector(changFontSize), name: NSNotification.Name(rawValue:"changnetworkMode"), object: nil)
            case 4://非wifi网路播放提醒
                 NotificationCenter.default.addObserver(self, selector: #selector(changPlayNotice), name: NSNotification.Name(rawValue:"changnPlayNotice"), object: nil)
            default:
                break
            }
        default: break
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            switch indexPath.row{
                case 0: //清理缓存
                    clearCacheAlertController()
                case 1://设置字体大小
                    setupFontAlertController()
                case 3://非wifi网路流量
                    setupNetWorkAlertController()
                case 4://非wifi网路播放提醒
                    setupPlayNoticeAlertController()
                default:
                    break
                }
        default: break
            
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.theme_backgroundColor = "colors.tableViewBackgroundColor"
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}

extension SettingViewController{
    
    ///从沙河中获取缓存数据大小
    fileprivate func calculateDiskCashSize(){
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { (size) in
            ///转化为M
            let sizeM = Double(size) / 1024.0 / 1024.0
            let sizeString = String(format: "%.2fM", sizeM)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cacheSizeM"), object: self, userInfo: ["cacheSize":sizeString])
        }
    }
    
    ///非wifi网路流量并显示在cell
    @objc fileprivate func changnetworkMode(notification : Notification){
        let userInfo = notification.userInfo as! [String : AnyObject]
        let indexPath = IndexPath(row: 3, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.rightTitleLabel.text = userInfo["networkMode"] as? String
    }
    
    ///非wifi网路流量
    fileprivate func setupNetWorkAlertController(){
        let alertController = UIAlertController(title: "非wifi网路流量", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let bestAction = UIAlertAction(title: "最小效果（下载大图）", style: .default, handler: {(_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "networkMode"), object: self, userInfo: ["networkMode":"最小效果（下载大图）"])
        })
        let besterAction = UIAlertAction(title: "较省流量（智能下载）", style: .default, handler: {(_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "networkMode"), object: self, userInfo: ["networkMode":"较省流量（智能下载）"])
        })
        let leastAction = UIAlertAction(title: "极省流量（智能下图）", style: .default, handler: {(_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "networkMode"), object: self, userInfo: ["networkMode":"极省流量（智能下图）"])
        })
        alertController.addAction(cancelAction)
        alertController.addAction(besterAction)
        alertController.addAction(leastAction)
        alertController.addAction(bestAction)
        present(alertController, animated: true, completion: nil)
    }

    ///获取缓存大小并显示在cell
    @objc fileprivate func loadCacheSize(notification : Notification){
        let userInfo = notification.userInfo as! [String : AnyObject]
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.rightTitleLabel.text = userInfo["cacheSize"] as? String
        
    }
    
    ///弹出清理缓存提示框
    fileprivate func clearCacheAlertController(){
        let alertController = UIAlertController(title: "确定清除?", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {(_) in
            let cache = KingfisherManager.shared.cache
            cache.clearDiskCache()
            cache.clearMemoryCache()
            cache.cleanExpiredDiskCache()
            let sizeString = "0.00M"
             NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cacheSizeM"), object: self, userInfo: ["cacheSize":sizeString])
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    ///改变字体大小并显示在cell
    @objc fileprivate func changFontSize(notification : Notification){
        let userInfo = notification.userInfo as! [String : AnyObject]
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.rightTitleLabel.text = userInfo["fontSize"] as? String
    }
    
    ///设置字体大小
    fileprivate func setupFontAlertController(){
        let alertController = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let smallAction = UIAlertAction(title: "小", style: .default, handler: {(_) in
             NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fontSize"), object: self, userInfo: ["fontSize":"小"])
        })
        let middleAction = UIAlertAction(title: "中", style: .default, handler: {(_) in
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fontSize"), object: self, userInfo: ["fontSize":"中"])
        })
        let bigAction = UIAlertAction(title: "大", style: .default, handler: {(_) in
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fontSize"), object: self, userInfo: ["fontSize":"大"])
        })
        let largeAction = UIAlertAction(title: "特大", style: .default, handler: {(_) in
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fontSize"), object: self, userInfo: ["fontSize":"特大"])
        })
        alertController.addAction(cancelAction)
        alertController.addAction(smallAction)
        alertController.addAction(middleAction)
        alertController.addAction(bigAction)
        alertController.addAction(largeAction)
        present(alertController, animated: true, completion: nil)
    }
    
    ///非wifi网路播放提醒并显示在cell
    @objc fileprivate func changPlayNotice(notification : Notification){
        let userInfo = notification.userInfo as! [String : AnyObject]
        let indexPath = IndexPath(row: 4, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.rightTitleLabel.text = userInfo["PlayNotice"] as? String
    }
    
    ///非wifi网路播放提醒
    fileprivate func setupPlayNoticeAlertController(){
        let alertController = UIAlertController(title: "非wifi网路播放提醒", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let everyAction = UIAlertAction(title: "每次提醒", style: .default, handler: {(_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlayNotice"), object: self, userInfo: ["PlayNotice":"每次提醒"])
        })
        let onceAction = UIAlertAction(title: "提醒一次", style: .default, handler: {(_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlayNotice"), object: self, userInfo: ["PlayNotice":"提醒一次"])
        })
        alertController.addAction(cancelAction)
        alertController.addAction(everyAction)
        alertController.addAction(onceAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension SettingViewController{
    fileprivate func setupUI() {
        //plist文件路径
        let path = Bundle.main.path(forResource: "settingPlist", ofType: "plist")
        //plist文件中的数据
        let cellPlist = NSArray(contentsOfFile: path!) as! [Any]
        for dicts in cellPlist {
            let array = dicts as! [[String : Any]]
            var rows = [SettingModel]()
            for dict in array {
                let setting = SettingModel.deserialize(from: dict as NSDictionary)
                rows.append(setting!)
            }
            sections.append(rows)
        }
        tableView.ym_registerCell(cell: SettingCell.self)
        tableView.rowHeight = 44
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
    }
}
