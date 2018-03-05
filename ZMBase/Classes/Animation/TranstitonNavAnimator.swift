//
//  TranstitonNavAnimator.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/19.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit

open class TranstitonNavAnimator: NSObject, UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if (operation == .push) {
            return ModalAnimation()
        } else {
            return DismissAnimation()
        }
        
    }
}
