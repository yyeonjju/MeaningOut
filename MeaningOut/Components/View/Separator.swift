//
//  Separator.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit
import SnapKit

final class Separator: UIView {
    
    init(color : UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        self.clipsToBounds = true
        self.layer.cornerRadius = 1
        
        self.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
