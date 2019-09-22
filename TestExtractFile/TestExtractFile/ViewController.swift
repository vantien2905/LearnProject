//
//  ViewController.swift
//  TestExtractFile
//
//  Created by DINH VAN TIEN on 6/21/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import EpubExtractor
//import FolioReaderKit

class ViewController: UIViewController {

    private let epubExtractor = EPubExtractor()

    let folioReader = FolioReader()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
//        let destinationURL = URL(string: destinationPath!)?.appendingPathComponent("bogia")
//        self.epubExtractor.extractEpub(epubURL: Bundle.main.url(forResource: "bogia", withExtension: "mobi")!, destinationFolder: destinationURL!)

//        print(destinationURL!.path)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         openBook()
    }

    private func readerConfiguration() -> FolioReaderConfig {
        let config = FolioReaderConfig(withIdentifier: "READER")
        config.shouldHideNavigationOnTap = false
        config.scrollDirection = .horizontal

        config.enableTTS = false
        config.allowSharing = false

        return config
    }

    private func openBook() {
        let readerConfiguration = self.readerConfiguration()
        folioReader.presentReader(parentViewController: self, withEpubPath: Bundle.main.path(forResource: "suimlangcuabaycuu", ofType: "epub")!, andConfig: readerConfiguration)

//        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, andConfig: readerConfiguration)
    }

}

