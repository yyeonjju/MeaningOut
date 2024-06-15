//
//  ReuseIdentifierProtocol.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

protocol ReuseIdentifierProtocol {
    static var identifier : String {get}
}

extension UICollectionViewCell : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
