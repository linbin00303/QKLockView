//
//  CALayerExtension.swift
//  QOneSwiftProject
//
//  Created by Jingnan Zhang on 16/4/13.
//  Copyright © 2016年 Sulei Qin. All rights reserved.
//

import UIKit

class CALayerExtension: CALayer {
    
    
    
}
extension CALayer{
    
    func shake() {
        let ca:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "transform.translation.x")
        let s = 15
        ca.values = [-s, 0, s, 0, -s, 0, s, 0]
        ca.duration = 0.3
        ca.repeatCount = 2
        self.addAnimation(ca,forKey: "shakeAnimation") // 添加动画
    }
    
}