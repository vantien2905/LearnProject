//
//  SlideCell.swift
//  demoTableView
//
//  Created by DINH VAN TIEN on 11/7/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class SlideCell: UITableViewCell {
    
    @IBOutlet weak var cvSlide: UICollectionView!

    let cellId = "CollectionCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        cvSlide.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        cvSlide.delegate = self
        cvSlide.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SlideCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
