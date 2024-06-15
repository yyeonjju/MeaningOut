//
//  UserDefaults.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension UserDefaults {
    private var profileImageData: Data? {
        get { UserDefaults.standard.data(forKey: "profileImageData")}
        set { UserDefaults.standard.set(newValue, forKey: "profileImageData") }
    }
    
    func saveProfileImage(_ image : UIImage){
        let imageData = image.pngData()
        profileImageData = imageData
    }
    
    func returnSavedProfileImage() -> UIImage? {
        let savedData = profileImageData
        let savedImage = UIImage(data: savedData ?? Data())
        return savedImage
    }
}
