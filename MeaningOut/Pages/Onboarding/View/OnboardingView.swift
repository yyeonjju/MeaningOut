//
//  OnboardingView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit
import SnapKit

final class OnboardingView: UIView {

    // MARK: - UI
    private let logoImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = AssetImage.logoImage
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let launchImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = AssetImage.launch
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let startButton = MainOrangeButton(title : "시작하기")
    
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
        [logoImageView, launchImageView, startButton]
            .forEach{
                addSubview($0)

            }
    }
    
    func configureLayout() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(70)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(70)
        }
        
        launchImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(40)
            make.height.equalTo(launchImageView.snp.width)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(50)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(30)
        }
    }


}
