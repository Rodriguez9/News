//
//  MoreLoginViewController.swift
//  News
//
//  Created by YZH on 2019/4/9.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import IBAnimatable
class MoreLoginViewController: AnimatableModalViewController {

    @IBAction func moreLoginColseButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
