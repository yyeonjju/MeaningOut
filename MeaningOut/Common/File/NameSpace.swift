//
//  NameSpace.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit

internal let AppName = "MeaningOut"

enum Size {
    static let bigProfileImageWidth = CGFloat(110)
}

enum PageTitle {
    static let nicknameSetting = "Nickname Setting"
    static let profileImageSetting = "Profile Image Setting"
}

enum Font {
    static let regular13 = UIFont.systemFont(ofSize: 13)
    static let regular14 = UIFont.systemFont(ofSize: 14)
    static let regular15 = UIFont.systemFont(ofSize: 15)
    static let regular16 = UIFont.systemFont(ofSize: 16)
    
    static let bold13 = UIFont.boldSystemFont(ofSize: 13)
    static let bold14 = UIFont.boldSystemFont(ofSize: 14)
    static let bold15 = UIFont.boldSystemFont(ofSize: 15)
    static let bold16 = UIFont.boldSystemFont(ofSize: 16)
}

enum Color {
    static let mainOrange = UIColor(named: "mainOrange")
    static let black = UIColor(named: "black")
    static let gray1 = UIColor(named: "gray1")
    static let gray2 = UIColor(named: "gray2")
    static let gray3 = UIColor(named: "gray3")
    static let white = UIColor(named: "white")
}

enum IconImage {
    static let search = UIImage(systemName: "magnifyingglass")
    static let clock = UIImage(systemName: "clock")
    static let person = UIImage(systemName: "person")
    static let xmark = UIImage(systemName: "xmark")
    static let chevronRight = UIImage(systemName: "chevron.right")
    static let chevronLeft = UIImage(systemName: "chevron.left")
    static let cameraFill = UIImage(systemName: "camera.fill")
}

enum ProfileImageName {
    static let profile0 = "profile_0"
    static let profile1 = "profile_1"
    static let profile2 = "profile_2"
    static let profile3 = "profile_3"
    static let profile4 = "profile_4"
    static let profile5 = "profile_5"
    static let profile6 = "profile_6"
    static let profile7 = "profile_7"
    static let profile8 = "profile_8"
    static let profile9 = "profile_9"
    static let profile10 = "profile_10"
    static let profile11 = "profile_11"
    
    static let profileImageNameList = [ProfileImageName.profile0, ProfileImageName.profile1, ProfileImageName.profile2, ProfileImageName.profile3, ProfileImageName.profile4, ProfileImageName.profile5, ProfileImageName.profile6, ProfileImageName.profile7, ProfileImageName.profile8, ProfileImageName.profile9, ProfileImageName.profile10, ProfileImageName.profile11]
    
    static func returnRandomProfileImageName() -> String {
        return profileImageNameList.randomElement()!
    }
}

enum AssetImage {
    static let logoImage = UIImage(named: "logoImage")
    static let empty = UIImage(named: "empty")
    static let launch = UIImage(named: "launch")
    static let likeSelected = UIImage(named: "like_selected")
    static let likeUnselected = UIImage(named: "like_unselected")
    
//    static let profile0 = UIImage(named: ProfileImageName.profile0)!
//    static let profile1 = UIImage(named: ProfileImageName.profile1)!
//    static let profile2 = UIImage(named: ProfileImageName.profile2)!
//    static let profile3 = UIImage(named: ProfileImageName.profile3)!
//    static let profile4 = UIImage(named: ProfileImageName.profile4)!
//    static let profile5 = UIImage(named: ProfileImageName.profile5)!
//    static let profile6 = UIImage(named: ProfileImageName.profile6)!
//    static let profile7 = UIImage(named: ProfileImageName.profile7)!
//    static let profile8 = UIImage(named: ProfileImageName.profile8)!
//    static let profile9 = UIImage(named: ProfileImageName.profile9)!
//    static let profile10 = UIImage(named: ProfileImageName.profile10)!
//    static let profile11 = UIImage(named: ProfileImageName.profile11)!
    
}

enum TextFieldValidationText {
    static let validNickname = "사용할 수 있는 닉네임이에요"
    
    static let invalidCount = "2글자 이상 10글자 미만으로 작성해주세요"
    static let invalidNumber = "숫자는 입력할 수 없어요"
    static func invalidCharacter(invalid : String) -> String {
        return "닉네임에 \(invalid)은 포함할 수 없어요"
    }
}

