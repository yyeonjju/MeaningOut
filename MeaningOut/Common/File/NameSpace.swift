//
//  NameSpace.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit
import SnapKit

internal let AppName = "MeaningOut"

enum NicknameValidation {
    static let invalidSpecialCharaters = ["@", "#", "$", "%"]
    static let textMinCount = 2
    static let textMaxCount = 9
    
    //+ 숫자 입력 불가
    
}


enum PageMode {
    case onboarding
    case edit
}

enum Size {
    static let bigProfileImageWidth = CGFloat(110)
    static let middleProfileImageWidth = CGFloat(80)
}

enum PageTitle {
    static let nicknameSetting = "Nickname Setting"
    static let profileImageSetting = "Profile Image Setting"
    static func searchMain(nickname:String) -> String {
        return "\(nickname)'s Meaning Out"
    }
    static let Settings = "Settings"
}

enum ToastMessage {
    static let checkNickname = "조건에 맞는 닉네임을 입력해주세요"
    static let signupComplete = "가입이 완료되었습니다"
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
    static let starFill = UIImage(systemName: "star.fill")
    static let cartFill = UIImage(systemName: "cart.fill")
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
}

enum NicknameValidationNoticeText {
    static let validNickname = "사용할 수 있는 닉네임이에요"
    
    static let invalidCount = "2글자 이상 10글자 미만으로 작성해주세요"
    static let invalidNumber = "숫자는 입력할 수 없어요"
    static func invalidCharacter(invalid : String) -> String {
        return "닉네임에 \(invalid)은 포함할 수 없어요"
    }
}

enum Sort : String, CaseIterable {
    //rawValue를 api fetch에 사용하기 위해
    case sim //정확도순 내림차순
    case date //날짜순 내림차순
    case asc //가격순 오름차순
    case dsc //가격순 내림차순
    
    //각 case에 대한 표시어로서의 계산 프로퍼티
    var sortText : String {
        get {
            switch self {
            case .sim:
                return "정확도"
            case .date:
                return "날짜순"
            case .asc:
                return "가격낮은순"
            case .dsc:
                return "가격높은순"
            }
        }
    }
}


enum SettingOptions : String, CaseIterable {
    case likeList = "나의 장바구니 목록"
    case fAQ = "자주 묻는 질문"
    case inquiry = "1:1문의"
    case pushSetting = "알림 설정"
    case userWithdrawal = "탈퇴하기"
    
    var trailingImage : UIImage? {
        switch self {
        case .likeList:
            return AssetImage.likeSelected
        case .fAQ, .inquiry, .pushSetting, .userWithdrawal:
            return nil
        }
    }
    
    func trailingLabelText(likeAmount : Int) -> String? {
        switch self {
        case .likeList:
            return "\(likeAmount)개의 상품"
        case .fAQ, .inquiry, .pushSetting, .userWithdrawal:
            return nil
        }
    }
    
}

enum TabViewType : String, CaseIterable, TabBarProtocol{
    case searchHome
    case likedItem
    case settings
    
    
    var rootVC : UIViewController.Type {
        switch self {
        case .searchHome:
            return SearchHomeViewController.self
        case .likedItem :
            return LikeItemListViewController.self
        case .settings:
            return SettingsViewController.self
        }
    }
    
    var iconImage : UIImage? {
        switch self {
        case .searchHome:
            return IconImage.search
        case .likedItem :
            return IconImage.cartFill
        case .settings:
            return IconImage.person
        }
    }
    
    var title : String {
        switch self {
        case .searchHome:
            return "검색"
        case .likedItem :
            return "장바구니"
        case .settings:
            return "설정"
        }
    }
    
}
