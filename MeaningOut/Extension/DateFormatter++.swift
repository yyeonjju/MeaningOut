//
//  DateFormatter++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/17/24.
//

import Foundation

extension DateFormatter {
    
    static var yearDotMonthDotDay : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }
}
