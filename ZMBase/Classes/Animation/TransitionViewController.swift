//
//  TransitionViewController.swift
//  YJK
//
//  Created by Miaoz on 2018/1/22.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit
import Then

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

open class TransitionViewController: UIViewController {
    
    lazy var transition : TransitionAnimator = {
        let trans = TransitionAnimator()
        
        trans.duration = 0.5
        
        return trans
    }()
    
    
    lazy var transitionNav : TranstitonNavAnimator = {
        let transNav = TranstitonNavAnimator()
        
        return transNav
    }()
    
    lazy var logoimgView = UIImageView().then {
        $0.frame = CGRect.init(x: kScreenWidth/2 - 144/2, y: 40, width: 144, height: 86)
        $0.image = #imageLiteral(resourceName: "login_logo")
    }
    
    lazy var imgv = UIImageView().then{
        $0.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        $0.center = CGPoint.init(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        $0.backgroundColor =  UIColor.black
        $0.isHidden = false
        //        imgv.layer.cornerRadius = 25
        //        imgv.layer.shadowOpacity = 0.3
        //        imgv.layer.shadowOffset = CGSize.init(width: 5, height: 5)
        //        imgv.layer.masksToBounds = false
        
        $0.layer.cornerRadius = 25
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowRadius = 4
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //present
        transitioningDelegate = transition
        
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self.transitionNav;
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.delegate = nil;
        
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //        imgv.layer.masksToBounds = true
     
        // Do any additional setup after loading the view.
         self.view.addSubview(self.imgv)
         self.view.addSubview(logoimgView)
        UIView.animate(withDuration: 0.5, animations: {
            
        }) { (_) in

            //Scale
            let scaleAnimate = Animate.baseAnimationWithKeyPath("transform.scale", fromValue: nil, toValue: 2, duration: 0.3, repeatCount: Float.infinity, timingFunction: nil)
            scaleAnimate.autoreverses = true
            self.imgv.layer.add(scaleAnimate, forKey: "transform.scale")
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//            self.imgv.isHidden = true
            self.imgv.layer.removeAllAnimations()

//            let viewController = HomeViewController()

            //设置转场样式:自定义 自定义UIPresentationController可能需要
            //            viewController.modalPresentationStyle = UIModalPresentationStyle.custom
            //动画弹出菜单
           
//           let homeRootVC = BaseNavigationController(rootViewController: viewController)
            
 
            
//            self.present(viewController, animated: true, completion: {
//                self.navigationController?.popViewController()
//                let window = UIApplication.shared.delegate?.window
//                window??.rootViewController =  UINavigationController(rootViewController: viewController)
//            })
           

//            self.navigationController?.pushViewController(viewController, animated: true)

        })
//
       
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.navigationController?.delegate = self.transitionNav;
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        
//         self.navigationController?.delegate = nil;
//     
//    }
    

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
