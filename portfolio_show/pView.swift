//
//  pView.swift
//  portfolio_show
//
//  Created by yate on 2017/3/15.
//  Copyright © 2017年 artt. All rights reserved.
//

import UIKit

class PView: UIView {


    let numberView = UILabel(frame: CGRect(x: 66, y: 18, width: 162, height: 177))
    let titleView = UITextView(frame: CGRect(x: 240, y: 67, width: 278, height: 300))
    let imageView = UIImageView(frame: CGRect(x: 46, y: 124, width: 677, height: 368))
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 768, height: 600)
        
        //设置数字
        numberView.font = UIFont(name: "CenturyGothic-Bold", size: 144)
        numberView.text = "01"
        
        //设置标题
        titleView.backgroundColor = UIColor.clear
        titleView.font = UIFont(name: "CenturyGothic-Bold", size: 64)
        titleView.text = "Ninja"
        
        numberView.layer.shadowOffset = CGSize(width: 0, height: 10)
        numberView.layer.shadowOpacity = 0.5
        numberView.layer.shadowRadius = 10
        numberView.layer.shouldRasterize = true
        numberView.layer.rasterizationScale = UIScreen.main.scale
                
        
        titleView.layer.shadowOffset = CGSize(width: 0, height: 10)
        titleView.layer.shadowOpacity = 0.5
        titleView.layer.shadowRadius = 10
        titleView.isUserInteractionEnabled = false
        titleView.layer.shouldRasterize = true
        titleView.layer.rasterizationScale = UIScreen.main.scale
        
        
        imageView.layer.shadowOffset = CGSize(width: 0, height: 36)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 42
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
        imageView.isUserInteractionEnabled = true
        
        
        
        
        
        
        self.addSubview(imageView)
        self.addSubview(titleView)
        self.addSubview(numberView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
