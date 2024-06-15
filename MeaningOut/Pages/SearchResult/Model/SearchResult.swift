//
//  SearchResult.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import Foundation

struct SearchResult: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [SearchResultItem]
}

struct SearchResultItem: Codable {
    let title, link, image, lprice, hprice, mallName, productId, productType, brand, maker: String
    let category1, category2, category3, category4: String
}
