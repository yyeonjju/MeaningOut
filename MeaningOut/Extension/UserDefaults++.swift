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
    
    var nickname: String? {
        get { UserDefaults.standard.string(forKey: "nickname")}
        set { UserDefaults.standard.set(newValue, forKey: "nickname") }
    }
    
    var searchList : [String]? {
        get { UserDefaults.standard.array(forKey: "searchList") as? [String]}
        set { UserDefaults.standard.set(newValue, forKey: "searchList") }
    }
}
