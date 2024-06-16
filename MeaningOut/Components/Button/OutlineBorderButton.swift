//
//  OutlineBorderButton.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import SnapKit

final class OutlineBorderButton : UIButton {
    var normalTitleColor : UIColor?
    var selectedTitleColor : UIColor?
    
    override var isSelected: Bool {
        didSet {
            configureButtonBackgroundColor(
                isSelected: isSelected,
                normalTitleColor : normalTitleColor,
                selectedTitleColor : selectedTitleColor
            )
        }
        
    }
    
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = self.bounds.height/2
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.titleLabel?.font = Font.bold13
        self.titleLabel?.textAlignment = .center
    }
    
    // MARK: - Initializer
    
    init(title : String, normalTitleColor : UIColor = Color.gray1!, isSelected : Bool) {
        super.init(frame: .zero)
        
        self.isSelected = isSelected
        self.normalTitleColor = normalTitleColor
        self.selectedTitleColor = Color.white!
        
        //Button 타이틀 설정
        self.setTitle(title, for: .normal)
        ///isSelected = false 상태일 때 TitleColor
        self.setTitleColor(normalTitleColor, for: .normal)
        ///isSelected = true 상태일 때 TitleColor
        self.setTitleColor(selectedTitleColor, for: .selected)
        
        //Button UI 설정
        self.layer.borderWidth = 1
        self.layer.borderColor = normalTitleColor.cgColor
        self.layer.masksToBounds = true
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        self.configuration = config
        

        configureButtonBackgroundColor(
            isSelected: isSelected,
            normalTitleColor : normalTitleColor,
            selectedTitleColor : selectedTitleColor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    private func configureButtonBackgroundColor(isSelected: Bool, normalTitleColor : UIColor?, selectedTitleColor : UIColor?) {
        guard let normalTitleColor else {return }

        ///isSelected 상태에 따른 backgroundColor
        self.backgroundColor = isSelected ? normalTitleColor : selectedTitleColor
    }

}
