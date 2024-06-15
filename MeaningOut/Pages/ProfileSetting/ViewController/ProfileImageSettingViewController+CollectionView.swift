//
//  ProfileImageSettingViewController+CollectionView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension ProfileImageSettingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileImageName.profileImageNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCollectionViewCell.identifier, for: indexPath) as! ProfileImageCollectionViewCell
        
        let cellImageName = ProfileImageName.profileImageNameList[indexPath.row]
        let selectedImageName = UserDefaults.standard.profileImageName
        
        cell.configureData(imageName: cellImageName, isSelected: cellImageName == selectedImageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCollectionViewCell.identifier, for: indexPath) as! ProfileImageCollectionViewCell
        let cellImageName = ProfileImageName.profileImageNameList[indexPath.row]
        self.profileImageName = cellImageName
        UserDefaults.standard.profileImageName = cellImageName
    }
    
}
