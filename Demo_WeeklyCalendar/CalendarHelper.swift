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
    
    func weekAndMonthOfYear(_ date: Date) -> String {
        dateFormatter.dateFormat = "MMMM yyyy"
        let week = calendar.component(.weekOfMonth, from: endOfWeek(date))-1
        let finalString = formattingWeekString(week) + dateFormatter.string(from: endOfWeek(date))
        return finalString
    }
    
    private func formattingWeekString(_ weekNumber: Int) -> String {
        var weekNum = String()
        if weekNumber == 1 {
            weekNum = "1st "
        } else if weekNumber == 2 {
            weekNum = "2nd"
        } else if weekNumber == 3 {
            weekNum = "3rd"
        } else if weekNumber == 4 {
            weekNum = "4th"
        } else {
            weekNum = "5th"
        }
        
        return weekNum + " Week of "
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
