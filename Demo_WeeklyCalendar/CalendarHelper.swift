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
    
    
    let getArrayOfHours : [Date] = {
        var arrDayHours = [Date]()
        
        let dateFormat1 = DateFormatter()
        dateFormat1.dateFormat = "H:mm"
        
//        let dateFormat2 = DateFormatter()
//        dateFormat2.dateFormat = "h:mm a"
        
        for hour in 0...23 {
            let str = "\(hour):00"
            let calDate = dateFormat1.date(from: str)!
            arrDayHours.append(calDate)
        }
        return arrDayHours
    }()
}

extension Date {
    func getHourStr() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "h:mm a"
        return dateFormat.string(from: self)
    }
}
