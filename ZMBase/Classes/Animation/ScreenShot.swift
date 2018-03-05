//
//  ScreenShot.swift
//  YJK
//
//  Created by Miaoz on 2018/1/22.
//  Copyright © 2018年 Miaoz. All rights reserved.
//
import UIKit

public extension UIView {
    func screenShot() -> UIImage{
        return screenShot(rect: bounds)
    }
    
    func screenShot(rect : CGRect) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        guard let content = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        
        let path = UIBezierPath(rect: rect)
        path.addClip()
        
        layer.render(in: content)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        
        image!.draw(at: CGPoint(x: -rect.origin.x, y: -rect.origin.y))
        
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image2!
    }
}

