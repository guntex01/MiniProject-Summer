//
//  ViewController.swift
//  MiniProject
//
//  Created by guntex01 on 5/27/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var sea: UIButton!
    @IBOutlet weak var place: UIButton!
    var audioPlayer :AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SUMMER"
        navigationController?.navigationBar.prefersLargeTitles = true
        sea.layer.cornerRadius = 20
        sea.layer.borderWidth = 2
        sea.layer.borderColor = UIColor.blue.cgColor
        place.layer.cornerRadius = 20
        place.layer.borderWidth = 2
        place.layer.borderColor = UIColor.blue.cgColor
        amthanh()
    }
    func amthanh(){
        let pathToSound = Bundle.main.path(forResource: "tiengve", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            self.audioPlayer?.play()
            
        } catch{
        print(error)
        }
    }
    @IBAction func seaButton(_ sender: Any) {
        let SecondVC = SecondViewController()
        audioPlayer?.pause()
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    
    @IBAction func placeButton(_ sender: Any) {
        let ThirstVC = ThirstViewController()
        audioPlayer?.pause()
        self.navigationController?.pushViewController(ThirstVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set cho navigationBar trong suốt để thấy ảnh ở background (cần đủ 3 dòng)
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.blue
    }
}

