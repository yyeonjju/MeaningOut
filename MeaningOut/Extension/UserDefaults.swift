//
//  UserDefaults.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension UserDefaults {
    var profileImageData: Data? {
        get { UserDefaults.standard.data(forKey: "profileImageData")}
        set { UserDefaults.standard.set(newValue, forKey: "profileImageData") }
    }
}


protocol ProfileImageDelegate {
    func saveProfileImage(image: UIImage)
}

extension ProfileImageDelegate {
    func saveProfileImage(image: UIImage) {
        print("🌱🌱image🌱🌱", image)
    }
}
