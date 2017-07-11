//
//  IntroViewController.swift
//  portfolio_show
//
//  Created by yate on 2017/3/17.
//  Copyright © 2017年 artt. All rights reserved.
//

import UIKit

class introView: UIView {

    
    var tagView = UIWebView()
    var enter = UIView()
    var hi = UILabel()
    var im = UILabel()
    
    
    

   override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
    self.backgroundColor = UIColor.white
    
    //设置大标题
    hi.frame = CGRect(x: 96, y: 90, width: 205, height: 78)
    hi.text = "HELLO!"
    hi.font =  UIFont(name: "CenturyGothic-Bold", size: 64)
    
    im.frame = CGRect(x: 96, y: 168, width: 768, height: 78)
    im.text = "I’m Yate Ge."
    im.font =  UIFont(name: "CenturyGothic-Bold", size: 64)
    
    self.addSubview(hi)
    self.addSubview(im)
    
    
    
    
    
        tagView.isUserInteractionEnabled = false
        tagView.frame = CGRect(x: 0, y: 367, width: 768*2, height: 456*2)
        

        //加载processing
        let filePath=Bundle.main.path(forResource: "intro", ofType: "html")
        do {
            
            let htmlString = try String.init(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
            
            
            tagView.loadHTMLString(htmlString as String  , baseURL: NSURL.fileURL(withPath: filePath!))
            
        }
        catch {/* error handling here */}
        
        tagView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        tagView.center.x = 768/2
        tagView.center.y = 595 - 50
        
        
        
        // 设置按钮
        enter.frame = CGRect(x: 276, y: 889, width: 217, height: 60)
    
    self.addSubview(tagView)
    
    
        let text = UILabel(frame: CGRect(x: 32, y: 18, width: 153, height: 24))
        text.text = "Start to browse"
        text.textAlignment = NSTextAlignment.center
        text.font = UIFont(name: "MyriadPro-Regular", size: 24)
        enter.addSubview(text)
        enter.backgroundColor = UIColor.white
        enter.layer.shadowOffset = CGSize(width: 0, height: 5)
        enter.layer.shadowOpacity = 0.5
        enter.layer.shadowRadius = 10
        enter.layer.shadowColor = UIColor(white: 179/255, alpha: 1).cgColor
        enter.layer.shouldRasterize = true
        enter.layer.rasterizationScale = UIScreen.main.scale
        enter.isUserInteractionEnabled = true
    self.addSubview(enter)
        
        let tapToEnter = UITapGestureRecognizer(target: self, action: #selector(tapToEnter(_:)))
        enter.addGestureRecognizer(tapToEnter)
        

        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    func tapToEnter(_ sender:UITapGestureRecognizer){
        print("enter!")
        
 
        

        
        UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions(), animations: {
            
            self.alpha = 0
            
            
        }, completion: {(finished) -> Void in
            self.removeFromSuperview()
            
            
            
            
        })
        
        
    }
    

}
