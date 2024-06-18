//
//  String++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/18/24.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
      return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
