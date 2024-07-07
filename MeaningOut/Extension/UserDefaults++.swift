//
//  UserDefaults.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension UserDefaults {
    private var profileImageName: String? {
        get { UserDefaults.standard.string(forKey: "profileImageName")}
        set { UserDefaults.standard.set(newValue, forKey: "profileImageName") }
    }
    
    private var nickname: String? {
        get { UserDefaults.standard.string(forKey: "nickname")}
        set { UserDefaults.standard.set(newValue, forKey: "nickname") }
    }
    
    private var signupDate: Date? {
        get { UserDefaults.standard.object(forKey: "signupDate") as! Date?}
        set { UserDefaults.standard.set(newValue, forKey: "signupDate") }
    }
    
    
    private var searchList : [String]? {
        get { UserDefaults.standard.array(forKey: "searchList") as? [String]}
        set { UserDefaults.standard.set(newValue, forKey: "searchList") }
    }
    
    
    //profileImageName
    func saveProfileImageName(_ profileImageName : String?) {
        self.profileImageName = profileImageName
    }
    func getProfileImageName() -> String? {
        return self.profileImageName
    }
    
    //nickname
    func saveNickname(_ nickname : String?) {
        self.nickname = nickname
    }
    func getNickname() -> String? {
        return self.nickname
    }
    
    
    //signupDate
    func saveSignupDate(_ signupDate : Date?) {
        self.signupDate = signupDate
    }
    func getSignupDate() -> Date {
        return signupDate ?? Date()
    }
    
    
    //searchList
    func saveSearchList(_ searchList : [String]?) {
        self.searchList = searchList
    }
    func getSearchList() -> [String]? {
        return searchList
    }
    
    
    
    
    //removeAllUserData
    func removeAllUserData() {
        saveProfileImageName(nil)
        saveNickname(nil)
        saveSignupDate(nil)
        saveSearchList(nil)
    }
    
    
    
}
