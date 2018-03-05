//
//  ModalAnimation.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/18.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit

typealias ActionCallBackBlcok = (_ type:String) -> Void

open class ModalAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresent = true
     var actionCallBackBlcok:ActionCallBackBlcok?
    // 动画时间
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5
    }
    
    // modal动画
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        
        showController(using: transitionContext)
//        // 1、获取到要展现的视图
//        let toView = transitionContext.viewController(forKey: .to)!.view!
//        let fromView = transitionContext.viewController(forKey: .from)!.view!
//
//        // 2、把视图添加到容器上
//        isPresent ? transitionContext.containerView.addSubview(toView) : transitionContext.containerView.addSubview(fromView)
//
//        let snapVIew = !isPresent ? toView : fromView
//
//        let tImageView = UIImageView(image:snapVIew.screenShot(rect: CGRect(x: 0, y: 0, width: fromView.bounds.width, height: fromView.bounds.height * 0.5)))
//        let bImageView = UIImageView(image: snapVIew.screenShot(rect: CGRect(x: 0, y: fromView.bounds.height * 0.5, width: fromView.bounds.width, height: fromView.bounds.height)))
//        bImageView.frame.origin.y = fromView.bounds.height * 0.5
//        transitionContext.containerView.addSubview(tImageView)
//        transitionContext.containerView.addSubview(bImageView)
//
//        if !isPresent {
//            tImageView.transform = tImageView.transform.translatedBy(x: 0, y: -fromView.bounds.height * 0.5)
//            bImageView.transform = bImageView.transform.translatedBy(x: 0, y: fromView.bounds.height * 1.5)
//        }
//
//        // 3、执行动画
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
//            if self.isPresent {
//                tImageView.transform = tImageView.transform.translatedBy(x: 0, y: -fromView.bounds.height * 0.5)
//                bImageView.transform = bImageView.transform.translatedBy(x: 0, y: fromView.bounds.height * 1.5)
//            }else{
//                tImageView.transform = CGAffineTransform.identity
//                bImageView.transform = CGAffineTransform.identity
//            }
//        }) { (flag) in
//
//             transitionContext.completeTransition(true)
////            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
////                //                button.isStopLoginingAni = true
////                imgv.layer.removeAllAnimations()
////                UIView.animate(withDuration: 0.5, animations: {
////                    imgv.transform = CGAffineTransform.init(scaleX: 10, y: 10)
////                }, completion: { (_) in
////                    //                 self.dismissClick()
////                    toView.backgroundColor = UIColor.clear
////
////                })
////
////
////            })
//
//        }
//
//
//
        
        
        
        
        
        // 获取到需要modal的控制器的view
//       let toView = transitionContext.viewController(forKey: .to)!.view!
//        
//        // 将需要modal的控制器的view添加到容器视图
//        transitionContext.containerView.addSubview(toView)
//        
//        toView.transform = CGAffineTransform.init(scaleX: 1, y: 0)
//        toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
//        
//        // 动画缩放modal的控制器的view到正常大小
//        UIView.animate(withDuration: transitionDuration(using: nil), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
//            toView.transform = CGAffineTransform.identity
//        }, completion: { (_) -> Void in
//            transitionContext.completeTransition(true)
//        })
    }
    
    
    /// 处理显示controller动画
    ///
    /// - Parameter transitionContext: 上下文
    func showController(using transitionContext: UIViewControllerContextTransitioning){
        animationWayPresent(using: transitionContext)
    }
}

extension ModalAnimation: CAAnimationDelegate {
   
    
    func animationWayPresent(using transitionContext: UIViewControllerContextTransitioning){
        //present
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!.view!

        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!.view!
        //pop
//        let fromView = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! UINavigationController).viewControllers.last!.view!
//        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!.view!
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)

        let maskLayer = CAShapeLayer()
        maskLayer.fillColor = UIColor.darkGray.cgColor
        toView.layer.mask = maskLayer
        let path1 = UIBezierPath(ovalIn:CGRect(x: fromView.frame.size.width/2, y: fromView.frame.size.height/2, width: 20, height: 20)).cgPath
        
        let path2 = UIBezierPath(arcCenter: containerView.center, radius: fromView.bounds.height , startAngle: 0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true).cgPath
        
        maskLayer.path = path2
        let animation = addAnimationTo(fromValue: path1, toValue: path2, transitionContext: transitionContext)
        maskLayer.add(animation, forKey: "presentAnimation")
    }
    
    func addAnimationTo(fromValue : Any?, toValue : Any , transitionContext : UIViewControllerContextTransitioning) -> CAAnimation {
        let animation = Animate.baseAnimationWithKeyPath("path", fromValue: fromValue, toValue: toValue, duration: 0.5, repeatCount: nil, timingFunction: nil)
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        animation.setValue(transitionContext, forKey: "transitionContext")
        
        return animation
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
       
        if self.actionCallBackBlcok != nil {
            self.actionCallBackBlcok!("")
        }
            let transitionContext = anim .value(forKey: "transitionContext") as! UIViewControllerContextTransitioning
            transitionContext.completeTransition(true)
            transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view.layer.mask = nil
       
    }
    
    
    
    
}
