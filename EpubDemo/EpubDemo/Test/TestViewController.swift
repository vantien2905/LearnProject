//
//  TestViewController.swift
//  EpubDemo
//
//  Created by DINH VAN TIEN on 6/18/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
//import FolioReaderKit
import Foundation
import EpubExtractor

class TestViewController: UIViewController {

//    let folioReader = FolioReader()

     private let epubExtractor = EPubExtractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let destinationURL = URL(string: destinationPath!)?.appendingPathComponent("bogia")
        self.epubExtractor.extractEpub(epubURL: Bundle.main.url(forResource: "bogia", withExtension: "mobi")!, destinationFolder: destinationURL!)

        print(destinationURL!.path)

    }

//    private func readerConfiguration() -> FolioReaderConfig {
//        let config = FolioReaderConfig(withIdentifier: "READER")
//        config.shouldHideNavigationOnTap = false
//        config.scrollDirection = .horizontal
//
//        // Custom sharing quote background
////        config.quoteCustomBackgrounds = []
//        config.enableTTS = false
//        config.allowSharing = false
//
//        return config
//    }

    fileprivate func open() {

//        let currentWorkingPath = fileManager.currentDirectoryPath
//        var sourceURL = URL(fileURLWithPath: currentWorkingPath)
//        sourceURL.appendPathComponent("archive.zip")
//        var destinationURL = URL(fileURLWithPath: currentWorkingPath)
//        destinationURL.appendPathComponent("directory")
//        do {
////            try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
//            try fileManager.unzipItem(at: bookPathURL, to: documentsPathURL)
//        } catch {
//            print("Extraction of ZIP archive failed with error:\(error)")
//        }


//        guard let des = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//
//        do {
//            let filePath = Bundle.main.url(forResource: "bogia", withExtension: "mobi")!
////            let unzipDirectory = try Zip.quickUnzipFile(filePath) // Unzip
////            try Zip.unzipFile(filePath, destination: des, overwrite: true, password: nil)
//            SSZipArchive.unzipFile(atPath: filePath.path, toDestination: des.path, delegate: self)
////            let zipFilePath = try Zip.quickZipFiles([filePath], fileName: "archive") // Zip
//        }
//        catch {
//            print("Something went wrong")
//        }




//        let readerConfiguration = self.readerConfiguration()
//        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, andConfig: readerConfiguration)
//        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, unzipPath: nil, andConfig: readerConfiguration, shouldRemoveEpub: false, animated: true)
//        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, andConfig: readerConfiguration, shouldRemoveEpub: false)
    }

}
