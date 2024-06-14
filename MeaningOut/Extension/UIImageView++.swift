//
//  UIImageView++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit

extension UIImageView {
    func configureDefaultImageView() {
        self.backgroundColor = Color.gray2
        self.layer.cornerRadius = 10
        self.contentMode = .scaleAspectFill
    }
    
    func configureCircleImageView(color : UIColor? = Color.gray2) {
        self.backgroundColor = color
        self.layer.cornerRadius = self.frame.width/2
        self.contentMode = .scaleAspectFill
    }
}
