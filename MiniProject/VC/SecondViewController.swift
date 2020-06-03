//
//  SecondViewController.swift
//  MiniProject
//
//  Created by guntex01 on 5/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import AVFoundation
class SecondViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    
    var views = [CustomView]()
    var timer :Timer!
    var audioPlayer :AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anhbien()
        title = "BIỂN"
        amthanh()
        setupScrollView(views)
        setupView(view: views)
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = views.count
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let imageButton = UIBarButtonItem(image: UIImage(named: "back1"),
                                          style: .done,
                                          target: self,
                                          action: #selector(backHome))
        self.navigationItem.leftBarButtonItem = imageButton
        navigationController?.navigationBar.tintColor = UIColor.red
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    @objc func backHome(){
        audioPlayer?.pause()
        self.navigationController?.popViewController(animated: true)
                
    }
    
    @objc func moveToNextPage(){
        if self.scrollView.contentOffset.x < (self.scrollView.contentSize.width - (self.view.frame.width)){
            self.scrollView.contentOffset.x += self.view.bounds.width
        }
    }
    func amthanh(){
        let pathToSound = Bundle.main.path(forResource: "tiengsong", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            self.audioPlayer?.play()
            
        } catch{
            print(error)
        }
    }
    func anhbien(){
        
        let anh1 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh1.photoImage.image = UIImage(named: "seacondao")
        anh1.textLabel.text = "BÃI ĐẦM TRÂU: là một trong những bãi biển đẹp mà du khách không nên bỏ lỡ khi đi du lịch Côn Đảo. Bãi có sóng nhẹ, nước trong xanh, cát trắng mịn và chạy theo hình vòng cung."
        anh1.textLabel.numberOfLines = 0
        let anh2 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh2.photoImage.image = UIImage(named: "seacuadai")
        anh2.textLabel.text = "BIỂN CỬA ĐẠI: cách trung tâm Hội An không xa (khoảng 5 km), nằm trong địa phận thành phố Hội An, tỉnh Quảng Nam. Nơi đây có bờ cát trắng duyên dáng hiền hòa và là điểm gặp nhau giữa 3 con sông Thu Bồn, Trường Giang, Đế Võng."
        anh2.textLabel.numberOfLines = 0
        let anh3 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh3.photoImage.image = UIImage(named: "seamuine")
        anh3.textLabel.text = "BIỂN MŨI NÉ: Mũi Né là tên một mũi biển, một trung tâm du lịch nổi tiếng ở Phan Thiết được đưa vào danh sách các khu du lịch quốc gia Việt Nam. Tên gọi Mũi Né xuất phát từ việc ngư dân đánh cá, mỗi khi đi biển gặp bão tàu thuyền thường đến đây nương náu"
        anh3.textLabel.numberOfLines = 0
        let anh4 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh4.photoImage.image = UIImage(named: "seanhatrang")
        anh4.textLabel.text = "BIỂN NHA TRANG: Dưới ánh nắng mặt trời nhiệt đới, màu xanh của những triền núi nhấp nhô trên bờ, của các hòn đảo hoà cùng mầu biển biếc, như tôn thêm vẻ quyến rũ của những dải cát vàng dạt dào sóng trắng. Biển Nha Trang luôn rất sạch và đẹp. ... Bãi biển là nơi thu hút du khách nhất ở Nha Trang."
        anh4.textLabel.numberOfLines = 0
        let anh5 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh5.photoImage.image = UIImage(named: "seaphuquoc")
        anh5.textLabel.text = "VỊNH THÁI LAN: Được mệnh danh là bãi biển đẹp nhất Phú Quốc thuộc Vịnh Thái Lan. Bãi Sao với dòng nước xanh mát, sạch, bờ cát trắng mịn màng trải dài 7km. Dọc bãi Sao là hàng dương xanh tỏa bóng râm mát. Khung cảnh nơi đây yên bình, hoang sơ nếu đã một lần đến đảo Ngọc mà chưa đặt chân đến bãi Sao thì đó là điều đáng tiếc nhất trong hành trình của bạn."
        anh5.textLabel.numberOfLines = 0
        
        
        views.append(contentsOf: [anh1, anh2, anh3, anh4, anh5])
        
    }
    
    func setupScrollView(_ arrs: [CustomView]){
        for (index, item) in arrs.enumerated() {
            item.frame = CGRect(x: screenWidth * CGFloat(index), y: 0, width: screenWidth, height: screeHeight)
            scrollView.addSubview(item)
        }
        scrollView.contentSize = CGSize(width: screenWidth * CGFloat(arrs.count), height: screeHeight)
        
    }
    
    func setupView(view: [CustomView]){
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: screenWidth,
                                  height: screeHeight - 100)
        scrollView.contentSize = CGSize(width: screenWidth * CGFloat(view.count),
                                        height: screeHeight - 200)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< view.count{
            view[i].frame = CGRect(x: screenWidth * CGFloat(i),
                                   y: 0,
                                   width: screenWidth,
                                   height: screeHeight - 100)
        }
    }
    
}

extension SecondViewController: UIScrollViewDelegate{
    func scrollViewDidSrcoll(_scrollView: UIScrollView){
        if scrollView == scrollView {
            let pageIndex = round(scrollView.contentOffset.x/screenWidth)
            pageControl.currentPage = Int(pageIndex)
        }
    }
}


