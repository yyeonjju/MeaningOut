//
//  NicknameSettingView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit
import SnapKit

final class NicknameSettingView : UIView {
    // MARK: - UI
    let profileCircleView : ProfileCircleView = {
        let view = ProfileCircleView(width: Size.bigProfileImageWidth,image: AssetImage.randomProfileImage)
        
        return view
    }()
    
    let nicknameTextFieldView = NormalTextFieldView(placeholder: "닉네임을 입력해주세요 :)")
    
    let completeButton = MainOrangeButton(title: "완료")
    
    
    // MARK: - Lifecycle
    
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
        [profileCircleView, nicknameTextFieldView, completeButton]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        profileCircleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
        }
        
        nicknameTextFieldView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(profileCircleView.snp.bottom).offset(40)
        }
        
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextFieldView.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }

}
