//
//  ViewController.swift
//  portfolio_show
//
//  Created by yate on 2017/3/4.
//  Copyright © 2017年 artt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelsView: UIView!
    @IBOutlet weak var webTop: UIWebView!
    var projectView = UIScrollView()
    var photoView = UIScrollView()
    var aboutView = UIScrollView()
    
    @IBOutlet weak var meView: UIScrollView!
    @IBOutlet weak var projectsLabel: UIButton!
    @IBOutlet weak var playLabel: UIButton!
    @IBOutlet weak var aboutLabel: UIButton!
    
    var contentY:CGFloat = 0
    
    var ninjaView = PView()
    var soleView = PView()
    var washView = PView()
    var appView = PView()
    
    var zhuPlay = fView()
    var tePlay = fView()
    var ppPlay = fView()
    var focusPlay = fView()
    var packPlay = fView()
    var PosterPlay = fView()
    var wawaPlay = fView()
    var zixiPlay = fView()
    var lkkPlay = fView()
    var zeroPlay = fView()
    
    var boboView = UIWebView()
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
    let blurView = UIVisualEffectView()
    
    let ninjaDetail = ProjectDetailView()
    let SoleDetail = ProjectDetailView()
    let WashDetail = ProjectDetailView()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        creatTimer()
        
        //加载头部web
        let filePath=Bundle.main.path(forResource: "index1", ofType: "html")
        do {
            
            let htmlString = try String.init(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
            
            
            webTop.loadHTMLString(htmlString as String  , baseURL: NSURL.fileURL(withPath: filePath!))
            
        }
        catch {/* error handling here */}
        
        // 设置顶部文字
        meView.backgroundColor = UIColor.clear
        meView.contentSize = CGSize(width: 768*4, height: 100)
        meView.isPagingEnabled = true
        meView.delegate = self
        meView.isUserInteractionEnabled = false
        meView.tag = 10
        
        
        let iDesign = UIImageView(image: UIImage(named: "iDesign"))
        let iReflect = UIImageView(image: UIImage(named: "iReflect"))
        let iCode = UIImageView(image: UIImage(named: "iCode"))
        let iDesign2 = UIImageView(image: UIImage(named: "iDesign"))
        
        iDesign.frame = CGRect(x: 0, y: 0, width: 768, height: 100)
        iCode.frame = CGRect(x: 768, y: 0, width: 768, height: 100)
        iReflect.frame = CGRect(x: 768*2, y: 0, width: 768, height: 100)
        iDesign2.frame = CGRect(x: 768*3, y: 0, width: 768, height: 100)
        
        meView.addSubview(iDesign)
        meView.addSubview(iCode)
        meView.addSubview(iReflect)
        meView.addSubview(iDesign2)
        
        
        


        
        
        // 设置毛玻璃效果
        blurView.effect = blurEffect
        blurView.frame = labelsView.bounds
        self.view.addSubview(blurView)
        
        // 设置
        scrollView.contentSize = CGSize(width: 2304, height: 698)
        scrollView.delegate = self
        scrollView.tag = 1
        
        // 去掉滚动条
        projectView.showsVerticalScrollIndicator = false
        photoView.showsVerticalScrollIndicator = false
        
        // MARK: 设置topView
        topView.backgroundColor = UIColor.white
        
        // MARK: 设置labelsView
        labelsView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        
        
        // MARK: projectView设置
        projectView.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        projectView.contentSize = CGSize(width: 768, height: 2880-600)
        
        projectView.backgroundColor = UIColor(white: 244/255, alpha: 1)
        projectView.bounces = false
        projectView.delegate = self
        projectView.tag = 2
        
        let whiteTopView = UIView(frame: CGRect(x: 0, y: 0, width: 768, height: 66))
        whiteTopView.backgroundColor = UIColor.white
        projectView.addSubview(whiteTopView)
        
        // ninja
        ninjaView.frame.origin = CGPoint(x: 0, y: 120)
        ninjaView.imageView.image = UIImage(named: "project1")
        
        let ninjaColor = UIColor(red: 44/255, green: 82/255, blue: 157/255, alpha: 1)
        ninjaView.numberView.textColor = ninjaColor
        ninjaView.titleView.textColor = ninjaColor
        ninjaView.numberView.layer.shadowColor = ninjaColor.cgColor
        ninjaView.titleView.layer.shadowColor = ninjaColor.cgColor
        ninjaView.imageView.layer.shadowColor = UIColor(red: 126/255, green: 150/255, blue: 178/255, alpha: 1).cgColor
        
        projectView.addSubview(ninjaView)
        
        
        // sole
        soleView.frame.origin = CGPoint(x: 0, y: ninjaView.frame.origin.y + ninjaView.frame.height)
        soleView.imageView.image = UIImage(named: "project2")
        
        let soleColor = UIColor(red: 141/255, green: 226/255, blue: 48/255, alpha: 1)
        soleView.numberView.textColor = soleColor
        soleView.titleView.textColor = soleColor
        soleView.numberView.text = "02"
        soleView.titleView.text = "Future Walking Kit"
        
        soleView.numberView.layer.shadowColor = soleColor.cgColor
        soleView.titleView.layer.shadowColor = soleColor.cgColor
        soleView.imageView.layer.shadowColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1).cgColor
        
        projectView.addSubview(soleView)
        
        // wash
        washView.frame.origin = CGPoint(x: 0, y: soleView.frame.origin.y + soleView.frame.height)
        washView.imageView.image = UIImage(named: "project3")
        
        let washColor = UIColor(red: 100/255, green: 209/255, blue: 246/255, alpha: 1)
        washView.numberView.textColor = washColor
        washView.titleView.textColor = washColor
        washView.numberView.text = "03"
        washView.titleView.text = "Washing"
        
        washView.numberView.layer.shadowColor = washColor.cgColor
        washView.titleView.layer.shadowColor = washColor.cgColor
        washView.imageView.layer.shadowColor = UIColor(red: 126/255, green: 150/255, blue: 178/255, alpha: 1).cgColor
        
        projectView.addSubview(washView)
   /*
        // app
        appView.frame.origin = CGPoint(x: 0, y: washView.frame.origin.y + washView.frame.height)
        appView.imageView.image = UIImage(named: "project3")
        
        let appColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
        appView.numberView.textColor = appColor
        appView.titleView.textColor = appColor
        appView.numberView.text = "04"
        appView.titleView.text = "Portfolio APP"
        
        appView.numberView.layer.shadowColor = appColor.cgColor
        appView.titleView.layer.shadowColor = appColor.cgColor
        appView.imageView.layer.shadowColor = UIColor(red: 126/255, green: 150/255, blue: 178/255, alpha: 1).cgColor
        
        projectView.addSubview(appView)
 
*/
        
        // 理解的设计
        let aboutDesign = UITextView(frame: CGRect(x: 44, y: washView.frame.origin.y + washView.frame.height + 20, width: 681, height: 80))
        aboutDesign.text = "“Design is not only about solving problems, but about speculating on  possible future and cultural innovation.”"
        aboutDesign.textColor = UIColor(white: 155/255, alpha: 1)
        aboutDesign.backgroundColor = UIColor.clear
        aboutDesign.font = UIFont(name: "MyriadPro-SemiboldIt", size: 28)
        aboutDesign.isUserInteractionEnabled = false
        
        //加载底部web
        boboView.frame = CGRect(x: 0 - 10, y: aboutDesign.frame.origin.y + aboutDesign.frame.height + 20, width: 778, height: 400)
        boboView.isUserInteractionEnabled = false
        
        
    
        boboView.backgroundColor = UIColor.clear
        let filePath2=Bundle.main.path(forResource: "index2", ofType: "html")
        do {
            
            let htmlString = try String.init(contentsOfFile: filePath2!, encoding: String.Encoding.utf8)
            
            
            boboView.loadHTMLString(htmlString as String  , baseURL: NSURL.fileURL(withPath: filePath!))
            projectView.addSubview(boboView)
            
        }
        catch {/* error handling here */}
        
        
        projectView.addSubview(aboutDesign)
        
        // 为图片添加点击收拾
        let tapNinja = UITapGestureRecognizer(target: self, action: #selector(tapNinja(_:)))
        ninjaView.addGestureRecognizer(tapNinja)
        let tapSole = UITapGestureRecognizer(target: self, action: #selector(tapSole(_:)))
        soleView.addGestureRecognizer(tapSole)
        let tapWash = UITapGestureRecognizer(target: self, action: #selector(tapWash(_:)))
        washView.addGestureRecognizer(tapWash)
        let tapApp = UITapGestureRecognizer(target: self, action: #selector(tapApp(_:)))
        appView.addGestureRecognizer(tapApp)

        
        
            
        // MARK: photoView设置
        photoView.frame = CGRect(x: 768, y: 0, width: 768, height: 1024)
        photoView.contentSize = CGSize(width: 768, height: 3080)
        photoView.delegate = self
        photoView.tag = 3
        photoView.bounces = false
        photoView.backgroundColor = UIColor(white: 244/255, alpha: 1)
        
        let whiteTopView2 = UIView(frame: CGRect(x: 0, y: 0, width: 768, height: 66))
        whiteTopView2.backgroundColor = UIColor.white
        photoView.addSubview(whiteTopView2)
        
        // MARK: 设置play列表内容
        zhuPlay.frame.origin = origin(order: 1)
        zhuPlay.title.text = "水怪肚肚猪"
        zhuPlay.describe.text = "为一家杭州夜宵餐饮店设计"
        zhuPlay.tag1.text = "Logo design"
        zhuPlay.tag2.text = "2016.03"
        zhuPlay.photo1.image = UIImage(named: "pig1")
        zhuPlay.photo2.image = UIImage(named: "pig2")
        zhuPlay.photoWall.addSubview(zhuPlay.photo2)
        zhuPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 2
        zhuPlay.page.numberOfPages = 2
        photoView.addSubview(zhuPlay)
        
        
        tePlay.frame.origin = origin(order: 2)
        tePlay.title.text = "个人Logo"
        tePlay.describe.text = "这是我在高中时期第一次尝试“设计”，灵感来源于中国传统装饰图案，形成一个“特”字"
        tePlay.tag1.text = "Logo design"
        tePlay.tag2.text = "2011"
        tePlay.photo1.image = UIImage(named: "te")
    
        tePlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 1
        tePlay.page.numberOfPages = 1
        photoView.addSubview(tePlay)
        
        ppPlay.frame.origin = origin(order: 3)
        ppPlay.title.text = "桌面游戏设计"
        ppPlay.describe.text = "中学时期设计了许多的桌面游戏，这段设计游戏的经历也是我大学学习设计的原因"
        ppPlay.tag1.text = "Game design"
        ppPlay.tag2.text = "Board game"
        ppPlay.tag3.text = "Prototype"
        ppPlay.tag4.text = "2009"
        ppPlay.photo1.image = UIImage(named: "pp1")
        ppPlay.photo2.image = UIImage(named: "pp2")
        ppPlay.photo3.image = UIImage(named: "pp3")
        ppPlay.photoWall.addSubview(ppPlay.photo2)
        ppPlay.photoWall.addSubview(ppPlay.photo3)
        
        
        ppPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 3
        ppPlay.page.numberOfPages = 3
        photoView.addSubview(ppPlay)
        
        focusPlay.frame.origin = origin(order: 4)
        focusPlay.title.text = "Focuser"
        focusPlay.describe.text = "一个提醒你休息和专注的Arduino硬件，旨在实验 Calm technologu"
        focusPlay.tag1.text = "Arduino"
        focusPlay.tag2.text = "Interactive device"
        focusPlay.tag3.text = "Calm technology"
        focusPlay.tag4.text = "2015.10"
        focusPlay.photo1.image = UIImage(named: "focus3")
        focusPlay.photo2.image = UIImage(named: "focus2")
        focusPlay.photo3.image = UIImage(named: "focus1")
        focusPlay.photoWall.addSubview(focusPlay.photo2)
        focusPlay.photoWall.addSubview(focusPlay.photo3)
        
        
        focusPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 3
        focusPlay.page.numberOfPages = 3
        photoView.addSubview(focusPlay)
        
        packPlay.frame.origin = origin(order: 9)
        packPlay.title.text = "快递包装改良设计"
        packPlay.describe.text = "为了方便回收利用，对物流包装进行再设计，设计了一个节省空间又方便使用的方案"
        packPlay.tag1.text = "Package design"
        packPlay.tag2.text = "Prototype"
        packPlay.tag3.text = "2013.5"
        
        packPlay.photo1.image = UIImage(named: "pack1")
        packPlay.photo2.image = UIImage(named: "pack2")
        packPlay.photo3.image = UIImage(named: "pack3")
        packPlay.photoWall.addSubview(packPlay.photo2)
        packPlay.photoWall.addSubview(packPlay.photo3)
        
        
        packPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 3
        packPlay.page.numberOfPages = 3
        photoView.addSubview(packPlay)
        
        PosterPlay.frame.origin = origin(order: 10)
        PosterPlay.title.text = "街舞社海报设计"
        PosterPlay.describe.text = "为街舞社团设计的海报"
        PosterPlay.tag1.text = "Poster design"
        PosterPlay.tag2.text = "2013.09"
        
        
        PosterPlay.photo1.image = UIImage(named: "poster1")
        PosterPlay.photo2.image = UIImage(named: "poster2")
        PosterPlay.photo3.image = UIImage(named: "poster3")
        PosterPlay.photoWall.addSubview(PosterPlay.photo2)
        PosterPlay.photoWall.addSubview(PosterPlay.photo3)
        
        
        PosterPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 3
        PosterPlay.page.numberOfPages = 3
        photoView.addSubview(PosterPlay)
        
        
        
        wawaPlay.frame.origin = origin(order: 8)
        wawaPlay.title.text = "晴娃"
        wawaPlay.describe.text = "智能空气检测无人机（概念）"
        wawaPlay.tag1.text = "Product design"
        wawaPlay.tag2.text = "2015.06"

        wawaPlay.photo1.image = UIImage(named: "wawa1")
        wawaPlay.photo2.image = UIImage(named: "wawa2")
        wawaPlay.photo3.image = UIImage(named: "wawa3")
        wawaPlay.photo4.image = UIImage(named: "wawa4")
        wawaPlay.photoWall.addSubview(wawaPlay.photo2)
        wawaPlay.photoWall.addSubview(wawaPlay.photo3)
        wawaPlay.photoWall.addSubview(wawaPlay.photo4)
        
        wawaPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 4
        wawaPlay.page.numberOfPages = 4
        photoView.addSubview(wawaPlay)
        
        
        
        zixiPlay.frame.origin = origin(order: 7)
        zixiPlay.title.text = "上架第一款 iOS App"
        zixiPlay.describe.text = "自己设计加开发完成一款 iOS APP 的上架，并且第一次受到自己的真实的用户的邮件反馈"
        zixiPlay.tag1.text = "iOS development"
        zixiPlay.tag2.text = "2016.04"
        
        zixiPlay.photo1.image = UIImage(named: "zixi")
        
        zixiPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 1
        zixiPlay.page.numberOfPages = 1
        photoView.addSubview(zixiPlay)
        
        

        // MARK: 👋
        lkkPlay.frame.origin = origin(order: 5)
        lkkPlay.title.text = "LKK设计空间"
        lkkPlay.describe.text = "对洛可可创新设计学院的未来方向进行探索，往「设计师平台」方向进行创新设计"
        lkkPlay.tag1.text = "Web design"
        lkkPlay.tag2.text = "Prototype"
        lkkPlay.tag3.text = "2015.08"
        
        lkkPlay.photo1.image = UIImage(named: "lkk1")
        lkkPlay.photo2.image = UIImage(named: "lkk2")
        lkkPlay.photo3.image = UIImage(named: "lkk3")
        lkkPlay.photoWall.addSubview(lkkPlay.photo2)
        lkkPlay.photoWall.addSubview(lkkPlay.photo3)
        
        lkkPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 3
        lkkPlay.page.numberOfPages = 3
        photoView.addSubview(lkkPlay)
        
        
        zeroPlay.frame.origin = origin(order: 6)
        zeroPlay.title.text = "高端智能机器人创新设计"
        zeroPlay.describe.text = "在上海麦思哲设计参与的机器人项目，内容包括软硬件规划及设计"
        zeroPlay.tag1.text = "Experience design"
        zeroPlay.tag2.text = "Interaction design"
        zeroPlay.tag3.text = "Product design"
        zeroPlay.tag4.text = "2015.11"
        
        
        
        zeroPlay.photo1.image = UIImage(named: "zero1")
        zeroPlay.photo2.image = UIImage(named: "zero2")
        zeroPlay.photoWall.addSubview(zeroPlay.photo2)
        
        
        zeroPlay.photoWall.contentSize.width = zhuPlay.photoWall.frame.width * 2
        zeroPlay.page.numberOfPages = 2
        photoView.addSubview(zeroPlay)
        
        
        
        
        // 改变内容长度
        photoView.contentSize.height = CGFloat(390 * 10 + 220)
        
        
        // MARK: aboutView设置
        aboutView.frame = CGRect(x: 768*2, y: 0, width: 768, height: 1024)
        aboutView.contentSize = CGSize(width: 768, height: 2831)
        aboutView.showsVerticalScrollIndicator = false
        aboutView.backgroundColor = UIColor(white: 244/255, alpha: 1)
        aboutView.delegate = self
        aboutView.tag = 4
        aboutView.bounces = false
    
        
        let aboutImage = UIImageView(image: UIImage(named: "about"))
        aboutImage.frame = CGRect(x: 0, y: 0, width: 768, height: 2831)
        aboutView.addSubview(aboutImage)
        
        let whiteTopView3 = UIView(frame: CGRect(x: 0, y: 0, width: 768, height: 66))
        whiteTopView3.backgroundColor = UIColor.white
        aboutView.addSubview(whiteTopView3)
        
        let aboutTag = UIWebView()
        aboutTag.isUserInteractionEnabled = false
        aboutTag.frame = CGRect(x: 0, y: 195, width: 768*2, height: 456*2)
        
        
        //加载processing
        let filePath3=Bundle.main.path(forResource: "intro2", ofType: "html")
        do {
            
            let htmlString = try String.init(contentsOfFile: filePath3!, encoding: String.Encoding.utf8)
            
            
            aboutTag.loadHTMLString(htmlString as String  , baseURL: NSURL.fileURL(withPath: filePath!))
            
        }
        catch {/* error handling here */}
        
        aboutTag.transform = CGAffineTransform.init(scaleX: 0.45, y: 0.45)
        aboutTag.center.x = 768/2
        aboutTag.center.y = 423
        aboutView.addSubview(aboutTag)
        
        let buding1 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 456*2))
        let buding2 = UIView(frame: CGRect(x: 0, y: 0, width: 768*2, height: 10))
            
            buding1.backgroundColor = UIColor(white: 244/255, alpha: 1)
            buding2.backgroundColor = UIColor(white: 244/255, alpha: 1)
        
        aboutTag.addSubview(buding1)
        aboutTag.addSubview(buding2)
        aboutTag.bringSubview(toFront: buding1)
        aboutTag.bringSubview(toFront: buding2)
        
        
        // MARK: 设置按钮
        projectsLabel.titleLabel?.font = UIFont(name: "CenturyGothic", size: 18)
        projectsLabel.isSelected = true
        projectsLabel.titleLabel?.backgroundColor = UIColor.clear
        
        projectsLabel.addTarget(self, action: #selector(tapProject(button:)), for: UIControlEvents.touchUpInside)
        playLabel.addTarget(self, action: #selector(tapProject(button:)), for: UIControlEvents.touchUpInside)
        aboutLabel.addTarget(self, action: #selector(tapProject(button:)), for: UIControlEvents.touchUpInside)
        
        
        
        // 添加视图和排列视图顺序
        scrollView.addSubview(projectView)
        scrollView.addSubview(photoView)
        scrollView.addSubview(aboutView)

        
        self.view.bringSubview(toFront: labelsView)
        self.view.bringSubview(toFront: topView)
        
        // 引导页
        let intro = introView(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
        self.view.addSubview(intro)
        self.view.bringSubview(toFront: intro)
        
        
        
        
        ninjaDetail.frame = CGRect(x: 768, y: 0, width: 768, height: 1024)
        ninjaDetail.content.contentSize = CGSize(width: 768, height: 9268)
        let ninjaContent = UIImageView(image: UIImage(named: "Ninja详情页"))
        ninjaDetail.content.addSubview(ninjaContent)
        self.view.addSubview(ninjaDetail)
        
        SoleDetail.frame = CGRect(x: 768, y: 0, width: 768, height: 1024)
        SoleDetail.content.contentSize = CGSize(width: 768, height: 5441)
        let SoleContent = UIImageView(image: UIImage(named: "Sole详情页"))
        SoleDetail.title.text = "Future Walking Kit"
        SoleDetail.content.addSubview(SoleContent)
        self.view.addSubview(SoleDetail)
        
        WashDetail.frame = CGRect(x: 768, y: 0, width: 768, height: 1024)
        WashDetail.content.contentSize = CGSize(width: 768, height: 8959)
        let washContent = UIImageView(image: UIImage(named: "wash详情页"))
        WashDetail.title.text = "Washing"
        WashDetail.content.addSubview(washContent)
        self.view.addSubview(WashDetail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapProject(button:UIButton){
        if button.isSelected == false {
            button.isSelected = true
            
            if button == projectsLabel{
                playLabel.isSelected = false
                aboutLabel.isSelected = false
                scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
            if button == playLabel{
                projectsLabel.isSelected = false
                aboutLabel.isSelected = false
                scrollView.contentOffset = CGPoint(x: 768, y: 0)
            }
            if button == aboutLabel{
                playLabel.isSelected = false
                projectsLabel.isSelected = false
                scrollView.contentOffset = CGPoint(x: 768*2, y: 0)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.tag == 1{
            print("减速停止了时执行，手触摸时执行执行")
            if scrollView.contentOffset == CGPoint(x: 0, y: 0){
                projectsLabel.isSelected = true
                playLabel.isSelected = false
                aboutLabel.isSelected = false
            }
            if scrollView.contentOffset == CGPoint(x: 768, y: 0){
                projectsLabel.isSelected = false
                playLabel.isSelected = true
                aboutLabel.isSelected = false
            }
            if scrollView.contentOffset == CGPoint(x: 768*2, y: 0){
                projectsLabel.isSelected = false
                playLabel.isSelected = false
                aboutLabel.isSelected = true
            }
        }
        
        if scrollView.tag == 10{
            if scrollView.contentOffset.x == 768*3{
                scrollView.contentOffset.x = 0
            }
        }
    
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.tag == 2{
            contentY = scrollView.contentOffset.y
            print("contentY=\(contentY)")
            
        }
        if scrollView.tag == 3{
            contentY = scrollView.contentOffset.y
            print("contentY=\(contentY)")
        }
        if scrollView.tag == 4{
            contentY = scrollView.contentOffset.y
            print("contentY=\(contentY)")
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 2{
            print("projectView滑起来")
            if (scrollView.contentOffset.y - contentY)>0{
                changPositionToTop()
            }
            if (scrollView.contentOffset.y - contentY)<=0 && scrollView.contentOffset.y<5{
                changPositionToBottom()
            }
            
        }
        if scrollView.tag == 3{
            print("projectView滑起来")
            if (scrollView.contentOffset.y - contentY)>0{
                changPositionToTop()
            }
            if (scrollView.contentOffset.y - contentY)<=0 && scrollView.contentOffset.y<5{
                changPositionToBottom()
            }
            
        }
        if scrollView.tag == 4{
            print("projectView滑起来")
            if (scrollView.contentOffset.y - contentY)>0{
                changPositionToTop()
            }
            if (scrollView.contentOffset.y - contentY)<=0 && scrollView.contentOffset.y<5{
                changPositionToBottom()
            }
            
        }
    }
  
    
    
    
    
    func changPositionToTop(){
        if labelsView.frame.origin.y == 328{
            UIView.animate(withDuration: 0.3, animations: {
                self.labelsView.frame.origin.y = 0
                self.blurView.frame.origin.y = 0
                self.topView.frame.origin.y = -328
                self.scrollView.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
                self.meView.frame.origin.y = -127
            })
            
        }
        
    }
    func changPositionToBottom(){
        if labelsView.frame.origin.y == 0{
            UIView.animate(withDuration: 0.3, animations: {
                self.labelsView.frame.origin.y = 328
                self.blurView.frame.origin.y = 328
                self.topView.frame.origin.y = 0
                self.scrollView.frame = CGRect(x: 0, y:328, width: 768, height: 698)
                self.meView.frame.origin.y = 127

            })
        }
        
    }
    
    func showAllFonts()
    {
        let familyNames = UIFont.familyNames
        
        var index:Int = 0
        
        for familyName in familyNames
        {
            let fontNames = UIFont.fontNames(forFamilyName: familyName as String)
            for fontName in fontNames
            {
                index += 1
                
                print("第 \(index) 个字体，字体font名称：\(fontName)")
            }
        }
    }
    
    func tapNinja(_ sender:UITapGestureRecognizer){
        print("tapNinja")
        // self.performSegue(withIdentifier: "toNinja", sender: nil)
        
        // 重新初始位置
        ninjaDetail.content.contentOffset = CGPoint(x: 0, y: 0)
        ninjaDetail.frame.origin = CGPoint(x: 768, y: 0)
        self.view.addSubview(ninjaDetail)
        self.view.bringSubview(toFront: ninjaDetail)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.ninjaDetail.frame.origin = CGPoint(x: 0, y: 0)
        })
        
        
    }
    func tapSole(_ sender:UITapGestureRecognizer){
        print("tapNtapSoleinja")
        // 重新初始位置
        SoleDetail.content.contentOffset = CGPoint(x: 0, y: 0)
        SoleDetail.frame.origin = CGPoint(x: 768, y: 0)
        
        self.view.addSubview(SoleDetail)
        self.view.bringSubview(toFront: SoleDetail)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.SoleDetail.frame.origin = CGPoint(x: 0, y: 0)
        })

    }
    func tapWash(_ sender:UITapGestureRecognizer){
        print("tapWash")
        // 重新初始位置
        WashDetail.content.contentOffset = CGPoint(x: 0, y: 0)
        WashDetail.frame.origin = CGPoint(x: 768, y: 0)
        
        self.view.addSubview(WashDetail)
        self.view.bringSubview(toFront: WashDetail)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.WashDetail.frame.origin = CGPoint(x: 0, y: 0)
        })
        
    }
    func tapApp(_ sender:UITapGestureRecognizer){
        print("tapApp")
        
    }
    
    func origin(order: Int) -> CGPoint {
       let y = (order - 1) * 390 + 140
       let a = CGPoint(x: 0, y: y)
        return a
    }
    
    // 创建计时器
    //创建轮播图定时器
    func creatTimer() {
        _ =  Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.timerManager), userInfo: nil, repeats: true)
        
        
        
    }
    
    //创建定时器管理者
    func timerManager() {
        
        self.meView.setContentOffset(CGPoint(x: self.meView.contentOffset.x + 768,y: 0), animated: true)
        if self.meView.contentOffset.x == 768*3 {
            self.meView.contentOffset = CGPoint(x: 0, y: 0)
        }
       
    }
    

}

