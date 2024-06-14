//
//  NormalTextFieldView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit
import SnapKit

final class NormalTextFieldView : UIView {
    
    // MARK: - UI
    let textField : UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = .none
        return tf
    }()
    
    private let textFieldUnderLine = Separator(color: Color.gray3!)
    
    let warningLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임에 @는 포함할 수 없어요"
        label.textColor = Color.mainOrange
        label.textAlignment = .left
        label.font = Font.regular14
        label.alpha = 0
        return label
    }()
    
    // MARK: - Initializer
    
    init(placeholder : String) {
        super.init(frame: .zero)
        
        self.textField.configurePlaceholderColor(placeholder)
        
        configureSubView()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [textField, textFieldUnderLine, warningLabel]
            .forEach{
                addSubview($0)

            }
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        textFieldUnderLine.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
        }
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(textFieldUnderLine.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
        }
        
    }

    
    
}
