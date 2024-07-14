//
//  ImageLoadManager.swift
//  MeaningOut
//
//  Created by 하연주 on 6/22/24.
//

import Foundation

/*
 class ImageLoadManager {
     static let shared = ImageLoadManager()
     private init() {}
     
     private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
         URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
     }
     
     func downloadImage(urlString: String, completion: @escaping (_ data : Data) -> Void ) {
         guard let url = URL(string: urlString) else { return }
         
         getData(from: url) { data, response, error in
             guard let data = data, error == nil else { return }
             completion(data)
         }
     }
     
 }

 func downloadImage(urlString: String, completion: @escaping (_ data : Data) -> Void ) {
     guard let url = URL(string: urlString) else { return }
     
     URLSession.shared.dataTask(with: url){ data, response, error in
         guard let data = data, error == nil else { return }
         completion(data)
         
     }.resume()
 }
 */

