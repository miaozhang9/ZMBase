//
//  DismissAnimator.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/18.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit

open class DismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
   let isPresent = false
    // 动画时间
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5
    }
    
    // dismiss动画
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        closeController(using: transitionContext)
//        // 获取到modal出来的控制器的view
//        // 1、获取到要展现的视图
//        let toView = transitionContext.viewController(forKey: .to)!.view!
//        let fromView = transitionContext.viewController(forKey: .from)!.view!
//
//        // 动画缩放modal出来的控制器的view到看不到
//        UIView.animate(withDuration: transitionDuration(using: nil), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
//            fromView.transform = CGAffineTransform.init(scaleX: 1, y: 0.001)
//        }, completion: { (_) -> Void in
//            transitionContext.completeTransition(true)
//        })
    }
    
    
    /// 处理dismiss动画
    ///
    /// - Parameter transitionContext: 上下文
    func closeController(using transitionContext: UIViewControllerContextTransitioning){
        animationWayDimmiss(using: transitionContext)
    }
}

extension DismissAnimation:CAAnimationDelegate {
    
    func animationWayDimmiss(using transitionContext: UIViewControllerContextTransitioning){
        //dismiss
        let fromView = transitionContext.viewController(forKey: .from)!.view!
        let toView =  transitionContext.viewController(forKey: .to)!.view!
        let toVC = (transitionContext.viewController(forKey: .to))
        // pop
//        let fromView = transitionContext.viewController(forKey: .from)!.view!
//        let toVC = (transitionContext.viewController(forKey: .to) as! UINavigationController)
//        let toView =  (transitionContext.viewController(forKey: .to) as! UINavigationController).viewControllers.last!.view!
        
        let containerView = transitionContext.containerView
        containerView.insertSubview((toVC?.view)!, at: 0)
      
        
        let maskLayer = CAShapeLayer()
        maskLayer.fillColor = UIColor.white.cgColor
        fromView.layer.mask = maskLayer
        let path1 = UIBezierPath(ovalIn: CGRect(x: toView.frame.size.width/2, y: toView.frame.size.height/2, width: 20, height: 20)).cgPath
        
        let path2 = UIBezierPath(arcCenter: containerView.center, radius: fromView.bounds.height , startAngle: 0, endAngle: CGFloat((Double.pi * 2.0)), clockwise: true).cgPath
        
        maskLayer.path = path1
        let animation = addAnimationTo(fromValue: path2, toValue: path1, transitionContext: transitionContext)
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

        let transitionContext = anim .value(forKey: "transitionContext") as! UIViewControllerContextTransitioning
        transitionContext.completeTransition(true)
        transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)?.view.layer.mask = nil
        
    }
}
