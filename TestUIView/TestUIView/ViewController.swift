//
//  ViewController.swift
//  TestUIView
//
//  Created by DINH VAN TIEN on 12/1/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wvPlay: WKWebView!
    @IBOutlet weak var vPlayVideo: VideoView!
    @IBOutlet var videoPlayer: YouTubePlayerView!
    @IBOutlet weak var btnTest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let myVideoURL = URL(string: "https://www.youtube.com/watch?v=gMDxQmjw4dQ") else { return }
        videoPlayer.loadVideoURL(myVideoURL)
        videoPlayer.play()
    }
    
    @IBAction func btnPlayTapped() {
        btnTest.isSelected = !btnTest.isSelected
        videoPlayer.play()
    }


}

