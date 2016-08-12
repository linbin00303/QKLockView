//
//  QKSetGesturePwdVC.swift
//  QOneSwiftProject
//
//  Created by Jingnan Zhang on 16/4/12.
//  Copyright © 2016年 Jingnan Zhang. All rights reserved.
//  设置手势密码   只有这个会了，验证手势密码的啥的，都会了，和这一样的！

import UIKit

class QKSetGesturePwdVC: UIViewController, QKLockViewDelegate {
    @IBOutlet weak var lockView: QKLockView!
    @IBOutlet weak var messageLab: UILabel!
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var closeBtn: UIButton!
    /** 保存第一次的密码 */
    var firstPwd = ""
    /** 保存第二次的密码 */
    var secondPwd = ""
    /** 最小需连接4点 */
    let minPionter = 4
    /** 错误次数 */
//    var errorCount = 0
    var imgVAry = [UIImageView]()
    
    private var _closeBtnHidden = true
    var closeBtnHidden:Bool  {
        get{
            return _closeBtnHidden
        }
        set{
            _closeBtnHidden = newValue
        }
    }
    
    
    // 关闭
    @IBAction func closeAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    // 重置
    @IBAction func resetBtnAction(sender: AnyObject) {
        lockView.setNeedsDisplay()
        messageLab.text = "请重新设置手势密码"
        resetBtn.hidden = true
        
        firstPwd = ""
        secondPwd = ""
        for imgV in imgVAry {
            imgV.image = UIImage(named: "gesture_pre_normal")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeBtn.hidden = closeBtnHidden
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 设置代理
        lockView.delegate = self
        self.drawPreView(preView)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    /**
     *  绘制preview
     */
    func drawPreView(view:UIView) {
        let imgVWH:CGFloat = 10
        let mergin:CGFloat = 10
        
        if imgVAry.count == 0 {
            for i in 0...8 {
                let imgV = UIImageView(frame: CGRectMake(CGFloat(i % 3) * (imgVWH + mergin),  CGFloat(i / 3 ) * (imgVWH + mergin),imgVWH, imgVWH))
                imgV.image = UIImage(named: "gesture_pre_normal")
                imgV.tag = i
                imgVAry.append(imgV)
                preView.addSubview(imgV)
            }

        }else{
            var ary = [String]()
            for char in firstPwd.characters {
                ary.append(String.init(char))
            }
            for string in ary {
                imgVAry[Int(string)!].image = UIImage(named: "gesture_pre_confirm")
            }
            
        }
    
    }
    
    /**
     * QKLockViewDelegate,
     */
    func lockView<T>(lockView: QKLockView, didEndWithPassCode passcode: T) {
        let pwd = passcode as! String
        if pwd.characters.count < minPionter {
            messageLab.text = "至少连接4个点！"
            messageLab.layer.shake()
        }else{ // 满足>=4个点
            
            resetBtn.hidden = false
            messageLab.text = "请再次输入"
            if firstPwd == "" {
                firstPwd = pwd
                self.drawPreView(preView)
            }else{ // 看二者是否一致,一致则发请求
                secondPwd = passcode as! String
                if secondPwd == firstPwd {
                    // 写自己需要处理的事即可，如 发请求啊。。。
                    print("手势密码设置成功！")
                    self.dismissViewControllerAnimated(true, completion: nil)
                }else{
                    messageLab.text = "两次密码不一致，请再次输入！"
                    messageLab.layer.shake()
                }
            }
        }

    }
    
}
