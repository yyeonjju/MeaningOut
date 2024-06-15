//
//  UserDefaults.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension UserDefaults {
    var profileImageName: String? {
        get { UserDefaults.standard.string(forKey: "profileImageName")}
        set { UserDefaults.standard.set(newValue, forKey: "profileImageName") }
    }
}
