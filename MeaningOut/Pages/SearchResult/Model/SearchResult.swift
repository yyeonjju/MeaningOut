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
    var items: [SearchResultItem]
    
    var totalLabelText : String {
        get{return "총 \(total.formatted()) 개의 검색 결과"}
    }
}

struct SearchResultItem: Codable {
    let title, link, image, lprice, hprice, mallName, productId, productType, brand, maker: String
    
    var priceText : String {
        get{ return (Int(lprice) ?? 0).formatted() + " 원" }
    }
}
