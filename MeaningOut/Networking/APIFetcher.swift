//
//  APIFetcher.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import Foundation
import Alamofire

protocol APIFetchable {
    func getSearchResult(keyword:String, page:Int, sort:String, displayAmount:Int, handler : @escaping (SearchResult?, String?)->Void) -> Void
}


class APIFetcher {
    typealias completionHandler<T:Decodable, E: Error> = (T?, E?, _ errorMessage : String?) -> Void
    
    func getSingle<T : Decodable>(
        model : T.Type,
        requestType : NetworkRequest,
        completionHandler : @escaping completionHandler<T, Error>
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
                    completionHandler(value, nil, nil)
                    
                case .failure(let error) :
                    var errorMessage: String?
                    if let data = response.data {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                            errorMessage = json["errorMessage"]
                        }
                    }
                    
                    completionHandler(nil, error, errorMessage)

                }
            }
    }

}


extension APIFetcher : APIFetchable{
    func getSearchResult(keyword:String, page:Int, sort:String, displayAmount:Int,  handler: @escaping (SearchResult?, String?) -> Void) {
        let requestType = NetworkRequest.searchProduct(query: keyword, start: String(page), display: String(displayAmount), sort: sort)
        
        getSingle(model : SearchResult.self, requestType : requestType){ value, error, errorMessage in
            handler(value, errorMessage)
        }
    }
}
