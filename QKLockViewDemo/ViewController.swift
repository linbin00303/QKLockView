//
//  ViewController.swift
//  Swift-GesturePwd
//
//  Created by Jingnan Zhang on 16/7/5.
//  Copyright © 2016年 Jingnan Zhang. All rights reserved.
//

import UIKit
import  QKLockView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // 去设置手势密码
    @IBAction func gotoSetPwdAction(sender: AnyObject) {
        let name = "QKSetGesturePwdVC"
        let sb = UIStoryboard.init(name: name, bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier(name)
        
        self.presentViewController(vc, animated: true, completion: nil)
    }

}

