//
//  Day_Dates_Week.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 28/06/23.
//

import SwiftUI

struct DatesOfWeek: View {
    @EnvironmentObject var dateHolder: DateHolder
    @EnvironmentObject var selectedDate: SelectedDate
    
    var body: some View {
        
        HStack(spacing: 1) {
//            let curr = CalendarHelper.shared.dayOfTheWeek(dateHolder.date)
//            let startWeek = CalendarHelper.shared.startOfWeek(dateHolder.date)
//            let endWeek = CalendarHelper.shared.endOfWeek(dateHolder.date)
            let wholeWeek = CalendarHelper.shared.getCurrentWeek(dateHolder.date)
            ForEach(wholeWeek, id: \.self) { date in
                if date.isSameDayAs(Date()) {
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundColor(Color.red.opacity(0.8))
                            .background(Color.clear)
                            .frame(height: 40)
                            .shadow(radius: 20)
                        Text(date.currentDay())
                            .dayOfWeek()
                            .frame(alignment: .center)
                            .onTapGesture {
                                selectedDate.date = date
                                debugPrint("Text Clicked.. Same Day")
                            }
                    }
                } else if date == selectedDate.date {
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundColor(Color.blue.opacity(0.8))
                            .background(Color.clear)
                            .frame(height: 40)
                            .shadow(radius: 20)
                        Text(date.currentDay())
                            .dayOfWeek()
                            .frame(alignment: .center)
                            .onTapGesture {
                                debugPrint("Text Clicked.. Same Day")
                            }
                    }
                } else {
                    Text(date.currentDay())
                        .dayOfWeek()
                        .frame(alignment: .center)
                        .onTapGesture {
                            selectedDate.date = date
                            debugPrint("Text Clicked.. Another Day. \(date.currentDay())")
                        }
                }
            }
        }
//        .padding(10)
        .frame(height: 40)
        .frame(minWidth: 125)
    }
    
}

var dayOfWeekStack: some View {
    HStack(spacing: 1) {
        Text("Sun").dayOfWeek()
        Text("Mon").dayOfWeek()
        Text("Tue").dayOfWeek()
        Text("Wed").dayOfWeek()
        Text("Thu").dayOfWeek()
        Text("Fri").dayOfWeek()
        Text("Sat").dayOfWeek()
    }
    //.padding(10)
    .frame(height: 40)
    .frame(minWidth: 125)
}
