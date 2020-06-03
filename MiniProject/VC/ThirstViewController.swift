//
//  ThirstViewController.swift
//  MiniProject
//
//  Created by guntex01 on 5/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import AVFoundation
class ThirstViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    
    var views = [CustomView]()
    var timer :Timer!
    var audioPlayer :AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        anhcanh()
        amthanh()
        title = "ĐỊA DANH"
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = views.count
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        setupScrollView(views)
        setupView(view: views)
        
        let imageButton = UIBarButtonItem(image: UIImage(named: "back1"),
                                          style: .done,
                                          target: self,
                                          action: #selector(backHome))
        self.navigationItem.leftBarButtonItem = imageButton
        
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
        let pathToSound = Bundle.main.path(forResource: "tiengchim", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            self.audioPlayer?.play()
            
        } catch{
            print(error)
        }
    }
    
    func anhcanh(){
        
        let anh1 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh1.photoImage.image = UIImage(named: "banahill")
        anh1.textLabel.text = "BANAHILL: Bà Nà Hills được biết đến là một trong những địa điểm nổi tiếng bậc nhất tại Việt Nam mà bất kỳ du khách nào cũng không thể bỏ qua. Nơi này được ví von như chốn ‘’tiên cảnh’’, như một ‘’châu Âu thu nhỏ trong lòng thành phố’’ với những công trình kiến trúc cổ đẹp ma mị, những trò chơi giải trí cực kỳ hấp dẫn hay cả một vườn hoa thơm ngát ngào ngạt chờ đón du khách đến chụp hình. Tất cả đã tạo nên một Bà Nà Hills cực kỳ độc đáo khiến cho bất kỳ du khách nào đã đến thì đều không nỡ bước chân đi. "
        anh1.textLabel.numberOfLines = 0
        let anh2 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh2.photoImage.image = UIImage(named: "halong")
        anh2.textLabel.text = "HẠ LONG: Vịnh Hạ Long thực sự là một kỳ quan thế giới, là một trong những điểm thu hút du khách lớn nhất ở Việt Nam. Đó cũng là nơi bạn có thể bơi lội thỏa thích trên những bãi biển hoang sơ tuyệt đẹp, chèo thuyền kayak trên vùng biển xanh biếc; khám phá những núi đá cao chót vót tưởng như cao vút lên trời xanh trên các hòn đảo; thưởng thức những món ăn hải sản địa phương tươi ngon trong khi ngắm cảnh hoàng hôn hay bình minh tuyệt đẹp."
        anh2.textLabel.numberOfLines = 0
        let anh3 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh3.photoImage.image = UIImage(named: "hangmua")
        anh3.textLabel.text = "HANG MÚA: Hang Múa là một điểm du lịch nằm trong vùng lõi Quần thể di sản thế giới Tràng An, tỉnh Ninh Bình.Hang Múa có đặc điểm địa chất, địa mạo đặc trưng của vùng núi đá vôi có tuổi đời hàng triệu năm.Điểm nhấn của khu du lịch Hang Múa là phong cảnh đẹp trên con đường dẫn lên đỉnh núi Múa được xây dựng mô phỏng theo kiến trúc Vạn Lý Trường Thành với gần 500 bậc thang đá."
        anh3.textLabel.numberOfLines = 0
        let anh4 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh4.photoImage.image = UIImage(named: "hoian")
        anh4.textLabel.text = "HỘI AN: Hội An – nơi mà cuộc sống cứ bình lặng như thế. Hội An – nơi mà dường như dòng chảy vô tình của thời gian chẳng thể nào vùi lấp đi cái không khí cổ xưa. Những mái ngói cũ phủ đầy rêu phong, những con đường ngập trong sắc đỏ của đèn lồng, những bức hoành phi được chạm trổ tinh vi, tất cả như đưa ta về với một thế giới của vài trăm năm trước. Đó mới chỉ là một phần dung dị ở khu phố cổ Hội An nhưng cũng đã đủ khiến người ta phải đắm say, đi quên lối."
        anh4.textLabel.numberOfLines = 0
        let anh5 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        anh5.photoImage.image = UIImage(named: "vinpeart")
        anh5.textLabel.text = "VINPEART: Tự hào là thương hiệu dẫn đầu, đại diện cho ngành khách sạn du lịch nghỉ dưỡng tại Việt Nam, Vinpearl mang trong mình sứ mệnh nâng tầm trải nghiệm nghỉ dưỡng, mang đến những kỳ nghỉ 5* cho du khách Việt Nam và du khách quốc tế. Các cơ sở khách sạn, biệt thự nghỉ dưỡng, các khu vui chơi giải trí của Vinpearl trải dài trên mảnh đất hơn 3000 km đường bờ biển. Mỗi lựa chọn điểm đến tại Vinpearl sẽ là một điểm dừng chân lý tưởng để trải nghiệm nghỉ dưỡng chuẩn quốc tế, cảm nhận trọn vẹn vẻ đẹp của từng thắng cảnh địa phương. Bên cạnh cơ sở nghỉ dưỡng, Vinpearl còn sở hữu hệ thống sân Vinpearl Golf, khu vui chơi giải trí đẳng cấp thế giới Vinpearl Land, công viên động vật hoang dã Vinpearl Safari, các khu chăm sóc sức khỏe và sắc đẹp, hệ thống phòng họp sang trọng, cùng các nhà hàng ẩm thực chất lượng quốc tế,… hứa hẹn mang đến cho du khách kỳ nghỉ ngập tràn cảm hứng, trọn vẹn niềm vui."
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
                                        height: screeHeight - 100)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< view.count{
            view[i].frame = CGRect(x: screenWidth * CGFloat(i),
                                   y: 0,
                                   width: screenWidth,
                                   height: screeHeight - 100)
        }
    }
}

extension ThirstViewController: UIScrollViewDelegate{
    func scrollViewDidSrcoll(_scrollView: UIScrollView){
        if scrollView == scrollView {
            let pageIndex = round(scrollView.contentOffset.x/screenWidth)
            pageControl.currentPage = Int(pageIndex)
        }
    }
}

