//
//  Dictionary++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import Foundation

extension Dictionary {
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = "?\(String(output.dropLast()))"
        return output
    }
}
