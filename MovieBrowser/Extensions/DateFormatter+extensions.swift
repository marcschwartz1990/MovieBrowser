//
//  DateFormatter+extensions.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/24/22.
//

import Foundation

extension DateFormatter {
    static var monthDayYearFormatting: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }
    
    static var monthDayYearDigitsOnlyFormatting: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        return formatter
    }
}
