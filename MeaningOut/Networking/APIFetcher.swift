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
        requestType : NetworkRequest,
        completionHandler : @escaping (T) -> Void,
        errorHandler : @escaping ()->Void = {}
    ) {
        AF.request(
            requestType.endpoint,
            method: requestType.method,
            parameters: requestType.parameters,
            encoding : requestType.encoding,
            headers: requestType.headers
        )
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
        let requestType = NetworkRequest.searchProduct(query: keyword, start: String(page), display: String(displayAmount), sort: sort)
        
        getSingle(model : SearchResult.self, requestType : requestType){ value in
            handler(value)
        }
    }
}
