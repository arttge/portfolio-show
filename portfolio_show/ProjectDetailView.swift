//
//  ProjectDetailView.swift
//  portfolio_show
//
//  Created by yate on 2017/3/20.
//  Copyright © 2017年 artt. All rights reserved.
//

import UIKit

class ProjectDetailView: UIView{

    var titleBar = UIView()
    var title = UILabel()
    var backButton = UIImageView(image: UIImage(named: "back"))
    var content = UIScrollView()
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
    let blurView = UIVisualEffectView()
    
    var location = CGPoint()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        self.backgroundColor = UIColor.white
        
        
        titleBar.frame = CGRect(x: 0, y: 0, width: 768, height: 66)
        titleBar.backgroundColor = UIColor(white: 1, alpha: 0.7)
        self.addSubview(titleBar)
        
        let tapTitle = UITapGestureRecognizer(target: self, action: #selector(tapTitle(_:)))
        titleBar.addGestureRecognizer(tapTitle)
        
        // 设置title
        title.frame = CGRect(x: 196, y: 21, width: 377, height: 24)
        title.font = UIFont(name: "CenturyGothic", size: 20)
        title.textAlignment = NSTextAlignment.center
        title.text = "Ninja"
        titleBar.addSubview(title)
        
        // 设置返回
        backButton.frame = CGRect(x: 0, y: 0, width: 106, height: 66)
        backButton.backgroundColor = UIColor.clear
        titleBar.addSubview(backButton)
        backButton.isUserInteractionEnabled = true
        
        let tapToBack = UITapGestureRecognizer(target: self, action: #selector(tapToBack(_:)))
        backButton.addGestureRecognizer(tapToBack)
        
        
        // 设置毛玻璃效果
        blurView.effect = blurEffect
        blurView.frame = titleBar.bounds
        self.addSubview(blurView)
        
        
        content.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        content.bounces = false
        
        self.addSubview(content)
        self.bringSubview(toFront: blurView)
        self.bringSubview(toFront: titleBar)
        
        
        // 设置全局手势
        let detectPan = UIPanGestureRecognizer(target: self, action:  #selector(detectPan(_:)))
        self.addGestureRecognizer(detectPan)
        
        
    
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapToBack(_ sender:UITapGestureRecognizer){
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: {
            self.frame.origin = CGPoint(x: 768, y: 0)
        }, completion: {(finished) -> Void in
            self.removeFromSuperview()
        })
    }
    
    func detectPan(_ sender: UIPanGestureRecognizer){
        if sender.state == UIGestureRecognizerState.began{
            print("监测到滑动")
            location = self.center
        }
        let translation  = sender.translation(in: self.superview!)
        // self.center = CGPoint(x: location.x + translation.x, y: location.y)
        if translation.x > 0{
            self.center = CGPoint(x: self.location.x + translation.x, y: self.location.y)
        }
        
        if sender.state == UIGestureRecognizerState.ended{
            
            if self.frame.origin.x > CGFloat(100) {
                
                UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: {
                    self.frame.origin = CGPoint(x: 768, y: 0)
                }, completion: {(finished) -> Void in
                    self.removeFromSuperview()
                })
                
            }else{
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.frame.origin = CGPoint(x: 0, y: 0)
                })
                
            }
            
        }
        
    }
    
    
    func tapTitle(_ sender: UITapGestureRecognizer){
    
        UIView.animate(withDuration: 0.3, animations: {
            self.content.contentOffset = CGPoint(x: 0, y: 0)
        })
    }
    
    
    
    
}
