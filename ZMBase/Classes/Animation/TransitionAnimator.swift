//
//  TransitionAnimator.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/17.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit
//动画类型
enum TransitionType : Int {
    case transfrom = 0
    case animation = 1
}

typealias TransitionCallBackBlcok = (_ type:String) -> Void

open class TransitionAnimator: NSObject ,UIViewControllerTransitioningDelegate{
    
     var transitionCallBackBlcok:TransitionCallBackBlcok?
    
    var animationType : TransitionType = .transfrom
    
    /// 转场动画时间
    lazy var duration : Double = 0.5
    
    /// 是不是present
    lazy var isPresent : Bool = true
    
    var presentFrame :CGRect = CGRect.init(x: 0, y: 0, width: 0, height: 0)
  
    // 返回一个控制器modal动画效果的对象
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresent = true
        let modalAnimation = ModalAnimation()
        modalAnimation.actionCallBackBlcok = { [unowned self] (type) in

            if self.transitionCallBackBlcok != nil {
                self.transitionCallBackBlcok!("")
            }


        }
          return modalAnimation
        
//        let modalAnimation = TransitionManager()
//        modalAnimation.isPresenting = true
//        return modalAnimation
        
//        let modalAnimation =  TransitionZoom()
//        modalAnimation.isPresenting = true
//        return modalAnimation
        
    }
    // 返回一个控制dismiss动画效果的对象
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresent = false
        return DismissAnimation()
        
//        let modalAnimation = TransitionManager()
//        modalAnimation.isPresenting = false
//        return modalAnimation
        
//        let modalAnimation =  TransitionZoom()
//        modalAnimation.isPresenting = false
//        return modalAnimation
    }
    
    
    // // 返回一个控制modal视图大小的对象
    //设置显示出来的ViewController的大小的，这里不用
//        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
//
//            let pvc = PresentAtionController(presentedViewController: presented, presenting: presenting)
//            //设置菜单的大小
//            pvc.presentFrame = self.presentFrame
//
//            return pvc
//    }
    
   
}


