//
//  ProductTable.swift
//  MeaningOut
//
//  Created by 하연주 on 7/7/24.
//

import Foundation
import RealmSwift


class ProductTable: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var link: String
    @Persisted var image: String
    @Persisted var lprice: String
    @Persisted var hprice: String
    @Persisted var mallName: String
    @Persisted var productId: String
    @Persisted var productType: String
    @Persisted var brand: String
    @Persisted var maker: String
    
    convenience init(title: String, link: String, image: String, lprice: String, hprice: String, mallName: String, productId: String, productType: String, brand: String, maker: String) {
        self.init()
        self.title = title
        self.link = link
        self.image = image
        self.lprice = lprice
        self.hprice = hprice
        self.mallName = mallName
        self.productId = productId
        self.productType = productType
        self.brand = brand
        self.maker = maker
    }
}
