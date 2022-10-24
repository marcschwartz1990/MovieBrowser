//
//  Date+extensions.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/24/22.
//

import Foundation

extension Date {
    var monthDayYearString: String {
        DateFormatter.monthDayYearFormatting.string(from: self)
    }
    
    var monthDayYearDigitsOnlyString: String {
        DateFormatter.monthDayYearDigitsOnlyFormatting.string(from: self)
    }
}
