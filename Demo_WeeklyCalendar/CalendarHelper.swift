//
//  CalendarHelper.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import Foundation

class CalendarHelper {
    
    static let shared = CalendarHelper()
    
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    func monthYearString(_ date: Date) -> String {
        dateFormatter.dateFormat = "LLL yyyy"
        return dateFormatter.string(from: date)
    }

    func plusWeek(_ date: Date) -> Date {
        return calendar.date(byAdding: .weekOfMonth, value: 1, to: date)!
    }
    
    func minusWeek(_ date: Date) -> Date {
        return calendar.date(byAdding: .weekOfMonth, value: -1, to: date)!
    }
    
    func getCurrentWeek(_ date: Date) -> [Date] {
        var week = [Date]()
        let startDay = startOfWeek(date)
        for i in 0...6 {
            let day = calendar.date(byAdding: .day, value: i, to: startDay)!
            week.append(day)
        }
        return week
    }
    
    func startOfWeek(_ date: Date) -> Date {
        let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
        return sunday
    }
    
    func endOfWeek(_ date: Date) -> Date {
        let sunday = startOfWeek(date)
        return calendar.date(byAdding: .day, value: 7, to: sunday)!
    }
    
    func dayOfTheWeek(_ date: Date) -> Int {
        let asd = calendar.dateComponents([.weekday], from: date)
        return asd.weekday!
    }
}
