//
//  NetworkManager.swift
//  MeaningOut
//
//  Created by 하연주 on 6/26/24.
//

import Foundation
import Alamofire

/*
 
 //alamofire 사용
enum NetworkRequest {
    
    case searchProduct(query: String, start: String, display: String, sort: String)
    
    
    
    
    private var baseURL : String{
        return "\(APIURL.scheme)://\(APIURL.host)/\(APIURL.version)/"
    }
    
    var endpoint : String {
        switch self {
        case .searchProduct:
            return baseURL + APIURL.naverShopping
        }
    }
    
    var method : HTTPMethod {
        return .get
        
    }
    
    var parameters : Parameters {
        switch self {
        case .searchProduct(let query, let start, let display, let sort):
            return ["query" : query, "start" : start, "display" : display, "sort": sort]
        }
    }
    
    var encoding : URLEncoding {
        switch self {
        case .searchProduct:
            return URLEncoding(destination: .queryString)
        }
    }
    
    var headers : HTTPHeaders {
        switch self {
        case .searchProduct:
            return [
                "X-Naver-Client-Id" : APIKey.naverClientID,
                "X-Naver-Client-Secret" : APIKey.naverKey
            ]
        }
    }
    
}
*/


//URLSession 사용
enum NetworkRequest {
    
    case searchProduct(query: String, start: String, display: String, sort: String)
    
    
    
    
    private var baseURL : String{
        return "\(APIURL.scheme)://\(APIURL.host)/\(APIURL.version)/"
    }
    
    var endpoint : String {
        switch self {
        case .searchProduct:
            return baseURL + APIURL.naverShopping
        }
    }
    
    var method : HTTPMethod {
        return .get
        
    }
    
    var parameters : [String : String] {
        switch self {
        case .searchProduct(let query, let start, let display, let sort):
            return ["query" : query, "start" : start, "display" : display, "sort": sort]
        }
    }
    
    var headers : HTTPHeaders {
        switch self {
        case .searchProduct:
            return [
                "X-Naver-Client-Id" : APIKey.naverClientID,
                "X-Naver-Client-Secret" : APIKey.naverKey
            ]
        }
    }
    
}


