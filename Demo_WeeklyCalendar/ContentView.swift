//
//  ContentView.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        VStack(spacing: 10) {
            DateScrollerView().environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
            calendarGrid
        }
        .padding(10)
    }
    
    var calendarGrid: some View {
        HStack(spacing: 1) {
//            let curr = CalendarHelper.shared.dayOfTheWeek(dateHolder.date)
//            let startWeek = CalendarHelper.shared.startOfWeek(dateHolder.date)
//            let endWeek = CalendarHelper.shared.endOfWeek(dateHolder.date)
            
            let wholeWeek = CalendarHelper.shared.getCurrentWeek(dateHolder.date)
            ForEach(wholeWeek, id: \.self) { date in
                Text(date.currentDay()).dayOfWeek()
            }
//            wholeWeek.forEach { datee in
//                Text(datee.currentDay())
//            }
        }
        .padding(10)
        .frame(minWidth: 125)
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
        }.padding(10)
            .frame(minWidth: 125)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

extension Date {
    func currentDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self).capitalized
    }
}
