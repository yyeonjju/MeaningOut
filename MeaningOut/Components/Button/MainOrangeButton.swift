//
//  MainOrangeButton.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit
import SnapKit

final class MainOrangeButton : UIButton{

    // MARK: - Initializer
    init(title : String) {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 25
        self.backgroundColor = Color.mainOrange
        self.setTitleColor(Color.white, for: .normal)
        self.setTitle(title, for: .normal)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

