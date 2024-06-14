//
//  ProfileImageSettingView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit
import SnapKit

class ProfileImageSettingView: UIView {

    // MARK: - UI
    let profileCircleView : ProfileCircleView = {
        let view = ProfileCircleView(width: Size.bigProfileImageWidth)
        
        return view
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
        [profileCircleView]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        profileCircleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
        }
    }


}
