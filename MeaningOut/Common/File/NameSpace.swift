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
    static let cameraFill = UIImage(systemName: "camera.fill")
}

enum AssetImage {
    static let logoImage = UIImage(named: "logoImage")
    static let empty = UIImage(named: "empty")
    static let launch = UIImage(named: "launch")
    static let likeSelected = UIImage(named: "like_selected")
    static let likeUnselected = UIImage(named: "like_unselected")
    
    static let profile0 = UIImage(named: "profile_0")!
    static let profile1 = UIImage(named: "profile_1")!
    static let profile2 = UIImage(named: "profile_2")!
    static let profile3 = UIImage(named: "profile_3")!
    static let profile4 = UIImage(named: "profile_4")!
    static let profile5 = UIImage(named: "profile_5")!
    static let profile6 = UIImage(named: "profile_6")!
    static let profile7 = UIImage(named: "profile_7")!
    static let profile8 = UIImage(named: "profile_8")!
    static let profile9 = UIImage(named: "profile_9")!
    static let profile10 = UIImage(named: "profile_10")!
    static let profile11 = UIImage(named: "profile_11")!
    
    static let profileImageList = [AssetImage.profile0, AssetImage.profile1, AssetImage.profile2, AssetImage.profile3, AssetImage.profile4, AssetImage.profile5, AssetImage.profile6, AssetImage.profile7, AssetImage.profile8, AssetImage.profile9, AssetImage.profile10, AssetImage.profile11]
    
    static let randomProfileImage = profileImageList.randomElement() ?? UIImage()
}

enum TextFieldValidationText {
    static let validNickname = "사용할 수 있는 닉네임이에요"
    
    static let invalidCount = "2글자 이상 10글자 미만으로 작성해주세요"
    static let invalidNumber = "숫자는 입력할 수 없어요"
    static func invalidCharacter(invalid : String) -> String {
        return "닉네임에 \(invalid)은 포함할 수 없어요"
    }
}

