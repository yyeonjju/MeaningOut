//
//  APIFetcher.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import Foundation
import Alamofire

protocol APIFetchable {
    func getSearchResult(keyword:String, page:Int, sort:String, displayAmount:Int, handler : @escaping (SearchResult)->Void) -> Void
}


class APIFetcher {
    func getSingle<T : Decodable>(
        model : T.Type,
        url : String,
        headers : HTTPHeaders = [],
        completionHandler : @escaping (T) -> Void,
        errorHandler : @escaping ()->Void = {}
    ) {
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: T.self) {response in
                switch response.result {
                case .success(let value) :
//                    print("success", value)
                    completionHandler(value)
                case .failure(let error) :
//                    print("error", error)
                    errorHandler()
                }
            }
    }

}


extension APIFetcher : APIFetchable{
    func getSearchResult(keyword:String, page:Int, sort:String, displayAmount:Int,  handler: @escaping (SearchResult) -> Void) {
        let queryParamDictionary = ["query":keyword, "start" : String(page), "display": String(displayAmount), "sort" : sort]
        let headers : HTTPHeaders = [
            "X-Naver-Client-Id" : APIKey.naverClientID,
            "X-Naver-Client-Secret" : APIKey.naverKey
        ]
        
        print("request url", "\(APIURL.naverShopping)\(queryParamDictionary.queryString)")
        
        getSingle(model: SearchResult.self, url: "\(APIURL.naverShopping)\(queryParamDictionary.queryString)", headers: headers){ value in
            handler(value)
        }
    }
}
