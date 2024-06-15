//
//  ProfileImageSettingViewController+CollectionView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension ProfileImageSettingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AssetImage.profileImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCollectionViewCell.identifier, for: indexPath) as! ProfileImageCollectionViewCell
        
        let cellImage = AssetImage.profileImageList[indexPath.row]
        let selectedImage = UserDefaults.standard.returnSavedProfileImage()
        
        print("🌸cellImage", cellImage.cgImage)
        print("🌸selectedImage", selectedImage?.cgImage)
        print("🌸이미지 같은가 다른가..🌸", cellImage == selectedImage)
        
        cell.configureData(image: cellImage, isSelected: cellImage.cgImage == selectedImage?.cgImage)
        
        return cell
    }
    
}
