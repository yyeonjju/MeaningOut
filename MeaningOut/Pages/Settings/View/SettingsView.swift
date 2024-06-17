//
//  SettingsView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import SnapKit

final class SettingsView: UIView {

    // MARK: - UI
    let profileContentsView : UIView = {
        let view = UIView()
        
        return view
    }()

    let profileCircleView : ProfileCircleView = {
        let view = ProfileCircleView(width: Size.middleProfileImageWidth, isCameraIconShown: false)
        guard let profileImageName = UserDefaults.standard.profileImageName else {return view}
        view.imageView.image = UIImage(named: profileImageName)
        
        return view
    }()
    
    let nicknameLabel : UILabel = {
        let label = UILabel()
        label.text = UserDefaults.standard.nickname
        label.font = Font.bold16
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "2222.22.22 가입"
        label.font = Font.regular13
        label.textColor = Color.gray2
        return label
    }()
    
    private let rightArrowIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = IconImage.chevronRight
        iv.tintColor = Color.gray2
        return iv
    }()
    
    let settingsTableView : UITableView = {
        let tv = UITableView()
//        tv.backgroundColor = .blue
        return tv
    }()
    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [profileContentsView, settingsTableView]
            .forEach{
                addSubview($0)
            }
        [profileCircleView, nicknameLabel, dateLabel, rightArrowIcon]
            .forEach{
                profileContentsView.addSubview($0)
            }
        
    }
    
    func configureLayout() {
        profileContentsView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(profileCircleView.snp.bottom)
        }
        
        profileCircleView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileCircleView.snp.top).offset(25)
            make.leading.equalTo(profileCircleView.snp.trailing).offset(20)
            
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(4)
            make.leading.equalTo(profileCircleView.snp.trailing).offset(20)

        }
        rightArrowIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.size.equalTo(20)
            make.centerY.equalTo(profileCircleView.snp.centerY)
        }
        
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(profileContentsView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }


}
