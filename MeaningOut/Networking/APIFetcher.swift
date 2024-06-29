//
//  APIFetcher.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import Foundation

protocol APIFetchable {
    func getSearchResult(keyword:String, page:Int, sort:String, displayAmount:Int, handler : @escaping (SearchResult?, String?)->Void) -> Void
}


class APIFetcher {
    
    typealias completionHandler<T:Decodable, E: Error> = (T?, E?) -> Void
    
    func getSingle<T : Decodable>(
        model : T.Type,
        requestType : NetworkRequest,
        completionHandler : @escaping completionHandler<T, RequestError>
    ) {
        ///URLComponents
        guard var component = URLComponents(string: requestType.endpoint) else {return }
        let queryItemArray = requestType.parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        component.queryItems = queryItemArray
        
        ///URLRequest
        guard let url = component.url else {return  completionHandler(nil, .url)}
        let request = try? URLRequest(url: url, method: requestType.method, headers: requestType.headers)

        guard let request else {return  completionHandler(nil, .urlRequestError) }
        
        ///dataTask
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completionHandler(nil,.failedRequest)
                    return
                }
                
                guard let data else {
                    completionHandler(nil,.noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(nil,.invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    var errorMessage: String?
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                        errorMessage = json["errorMessage"]
                    }
                    
                    completionHandler(nil,.failResponse(code: response.statusCode, message: errorMessage ?? "-"))
                    return
                }
                
                
                
                do {
                    let result = try JSONDecoder().decode(model.self, from: data)
                    completionHandler(result,nil)
                }catch {
                    completionHandler(nil,.invalidData)
                }
            }

        }
        .resume()
    }
    
}


extension APIFetcher : APIFetchable{
    func getSearchResult(keyword:String, page:Int, sort:String, displayAmount:Int,  handler: @escaping (SearchResult?, String?) -> Void) {
        let requestType = NetworkRequest.searchProduct(query: keyword, start: String(page), display: String(displayAmount), sort: sort)
        
        getSingle(model : SearchResult.self, requestType : requestType){ value, error in
            handler(value, error?.errorMessage)
        }
    }
}
