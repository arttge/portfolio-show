//
//  fView.swift
//  portfolio_show
//
//  Created by yate on 2017/3/16.
//  Copyright © 2017年 artt. All rights reserved.
//

import UIKit

class fView: UIView,UIScrollViewDelegate {

    var title = UILabel()
    var describe = UITextView()
    var tag1 = UILabel()
    var tag2 = UILabel()
    var tag3 = UILabel()
    var tag4 = UILabel()
    var photoWall = UIScrollView()
    
    var photo1 = UIImageView()
    var photo2 = UIImageView()
    var photo3 = UIImageView()
    var photo4 = UIImageView()
    
    var page = UIPageControl()
    
    let width = 280
    let height = 210
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 768, height: 360)
        self.backgroundColor = UIColor.clear
        
        photoWall.delegate = self
        
        // 设置文字描述
        let x = 76
        let desColor = UIColor(white: 74/255, alpha: 1)
        
        title.frame = CGRect(x: x, y: 77, width: 250, height: 30)
        title.font = UIFont(name: "MyriadPro-Bold", size: 22)
        title.textColor = UIColor.black
        title.text = "Personal Logo design"
        self.addSubview(title)
        
        describe.frame = CGRect(x: x, y: 105, width: 280, height: 60)
        describe.font = UIFont(name: "MyriadPro-Regular", size: 14)
        
        describe.textColor = desColor
        describe.backgroundColor = UIColor.clear
        describe.text = "It’s my first to design for business"
        describe.isUserInteractionEnabled = false
        self.addSubview(describe)
        
        tag1.frame = CGRect(x: x, y: 175, width: 130, height: 15)
        tag1.font = UIFont(name: "MyriadPro-It", size: 14)
        tag1.textColor = desColor
        tag1.text = "Logo design"
        self.addSubview(tag1)
        
        tag2.frame = CGRect(x: CGFloat(x), y: tag1.frame.origin.y+tag1.frame.height+5 , width: 130, height: 15)
        tag2.font = UIFont(name: "MyriadPro-It", size: 14)
        tag2.textColor = desColor
        tag2.text = "2012.09"
        self.addSubview(tag2)
        
        tag3.frame = CGRect(x: CGFloat(x), y: tag2.frame.origin.y+tag2.frame.height+5, width: 130, height: 15)
        tag3.font = UIFont(name: "MyriadPro-It", size: 14)
        tag3.textColor = desColor
        tag3.text = " "
        self.addSubview(tag3)
        
        tag4.frame = CGRect(x: CGFloat(x), y: tag3.frame.origin.y+tag3.frame.height+5, width: 130, height: 15)
        tag4.font = UIFont(name: "MyriadPro-It", size: 14)
        tag4.textColor = desColor
        tag4.text = " "
        self.addSubview(tag4)
        
        // 设置图片
        photoWall.frame = CGRect(x: 363-20-10, y: 0, width: 393, height: 360)
        let pos = photoWall.center
        photoWall.frame = CGRect(x: 0, y: 0, width: 393, height: 320)
        photoWall.center = pos
        photoWall.contentSize = CGSize(width: 393*4, height: height)
        photoWall.backgroundColor = UIColor.clear
        photoWall.isPagingEnabled = true
        photoWall.showsHorizontalScrollIndicator = false
        photoWall.bounces = true
        self.addSubview(photoWall)
        
        photo1.frame = CGRect(x: 0, y: 0, width: width, height: height)
        photo1.center = CGPoint(x: photoWall.frame.width/2, y: photoWall.frame.height/2)
    
        photo1.layer.shadowOffset = CGSize(width: 0, height: 10)
        photo1.layer.shadowOpacity = 0.5
        photo1.layer.shadowRadius = 18
        photo1.layer.shouldRasterize = true
        photo1.layer.rasterizationScale = UIScreen.main.scale
        photo1.layer.shadowColor = UIColor(white: 184/255, alpha: 1).cgColor
        
        photo1.image = UIImage(named: "pig1")
        photoWall.addSubview(photo1)
        
        photo2.frame = CGRect(x: 0, y: 0, width: width, height: height)
        photo2.center = CGPoint(x: photo1.center.x + photoWall.frame.width, y: photoWall.frame.height/2)
        
        photo2.layer.shadowOffset = CGSize(width: 0, height: 10)
        photo2.layer.shadowOpacity = 0.5
        photo2.layer.shadowRadius = 18
        photo2.layer.shouldRasterize = true
        photo2.layer.rasterizationScale = UIScreen.main.scale
        photo2.layer.shadowColor = UIColor(white: 184/255, alpha: 1).cgColor
        
        photo3.frame = CGRect(x: 0, y: 0, width: width, height: height)
        photo3.center = CGPoint(x: photo2.center.x + photoWall.frame.width, y: photoWall.frame.height/2)
        
        photo3.layer.shadowOffset = CGSize(width: 0, height: 10)
        photo3.layer.shadowOpacity = 0.5
        photo3.layer.shadowRadius = 18
        photo3.layer.shouldRasterize = true
        photo3.layer.rasterizationScale = UIScreen.main.scale
        photo3.layer.shadowColor = UIColor(white: 184/255, alpha: 1).cgColor
        
        photo4.frame = CGRect(x: 0, y: 0, width: width, height: height)
        photo4.center = CGPoint(x: photo3.center.x + photoWall.frame.width, y: photoWall.frame.height/2)
        
        photo4.layer.shadowOffset = CGSize(width: 0, height: 10)
        photo4.layer.shadowOpacity = 0.5
        photo4.layer.shadowRadius = 18
        photo4.layer.shouldRasterize = true
        photo4.layer.rasterizationScale = UIScreen.main.scale
        photo4.layer.shadowColor = UIColor(white: 184/255, alpha: 1).cgColor
        
        
        
        // 设置页面指示器
        page.center = CGPoint(x: photoWall.center.x, y: 320)
        page.backgroundColor = UIColor.clear
        page.numberOfPages = 3
        page.currentPage = 0
        page.currentPageIndicatorTintColor = UIColor.black
        page.pageIndicatorTintColor = UIColor(white: 0, alpha: 0.4)
        page.hidesForSinglePage = true
        
        self.addSubview(page)
    
    
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let a = scrollView.contentOffset.x/scrollView.frame.width
        page.currentPage = Int(a)
    }
}
