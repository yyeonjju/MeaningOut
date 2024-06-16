//
//  SearchResultViewController+CollectionView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit

extension SearchResultViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        
//        cell.label.text = "0000"
        return cell
    }
}
