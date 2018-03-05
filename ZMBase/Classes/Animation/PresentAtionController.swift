//
//  PresentAtionController.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/17.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit

open class PresentAtionController: UIPresentationController {
    
    var presentFrame :CGRect = CGRect.init(x: 0, y: 0, width: 0, height: 0)
    
    /**
     重写初始化方法,用于创建负责转场的动画
     - parameter presentedViewController:  被展现的控制器
     - parameter presentingViewController: 发起的控制器
     */
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
   
    /**
     重写containerViewWillLayoutSubviews,在即将布局转场子视图时调用
     */

    override open func containerViewWillLayoutSubviews() {
        //修改弹出视图的大小
        //        //presentedView: 被展现的视图
        //        //containerView: 容器视图
        
        // 设置容器视图透明背景
        containerView?.backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        presentedView?.frame = self.presentFrame
        
        let bgView = UIView.init(frame: self.presentFrame)
        bgView.backgroundColor = UIColor.white
    
        
       let imgv = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        imgv.center = CGPoint.init(x: presentFrame.size.width/2, y: presentFrame.size.height/2)
        imgv.backgroundColor = UIColor.cyan
        
        bgView.addSubview(imgv)
        containerView?.insertSubview(bgView, at:0)
        
        //Scale
        let scaleAnimate = Animate.baseAnimationWithKeyPath("transform.scale", fromValue: nil, toValue: 1.4, duration: 0.5, repeatCount: Float.infinity, timingFunction: nil)
        scaleAnimate.autoreverses = true
        imgv.layer.add(scaleAnimate, forKey: "transform.scale")
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
            //                button.isStopLoginingAni = true
            imgv.layer.removeAllAnimations()
            UIView.animate(withDuration: 0.5, animations: {
                  imgv.transform = CGAffineTransform.init(scaleX: 5, y: 5)
            }, completion: { (_) in
//                 self.dismissClick()
            })
          
           
        })
    }
    
    override open func containerViewDidLayoutSubviews() {
        
    }

    
    func dismissClick(){
    
    //presentedViewController非常重要,已经modal出来的控制器
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PopoverDismiss"), object: nil)
        presentedViewController.dismiss(animated: false, completion: nil)
//        presentedViewController.dismiss(animated: true, completion:nil)
    
    }

}
