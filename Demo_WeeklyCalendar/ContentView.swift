//
//  ContentView.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @State var isPopover = false
    
    let demoHours = CalendarHelper.shared.getArrayOfHours
    
    var body: some View {
        VStack {
            Button(action: { self.isPopover.toggle() }) {
                Image(nsImage: NSImage(named: NSImage.infoName) ?? NSImage())
            }.popover(isPresented: self.$isPopover, arrowEdge: .bottom) {
                     EventDetailView()
            }.buttonStyle(PlainButtonStyle())
        }.frame(height: 40)
            .frame(maxWidth: .infinity)
        VStack(spacing: 10) {
            DateScrollerView().environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
                .frame(height: 40)
            calendarGrid
            CalendarComponent(allEvents: [
                .init(startTime: demoHours[0], endTime: demoHours[1], title: "Demo Event"),
                .init(startTime: demoHours[3], endTime: demoHours[4], title: "Second Demo Event")
            ], calendarHeight: 24 * 40)
        }
        .frame(minWidth: screenWidth*0.5, minHeight: screenHeight*0.75)
        .padding(10)
    }
    
    var calendarGrid: some View {
        HStack(spacing: 1) {
//            let curr = CalendarHelper.shared.dayOfTheWeek(dateHolder.date)
//            let startWeek = CalendarHelper.shared.startOfWeek(dateHolder.date)
//            let endWeek = CalendarHelper.shared.endOfWeek(dateHolder.date)
            let wholeWeek = CalendarHelper.shared.getCurrentWeek(dateHolder.date)
            ForEach(wholeWeek, id: \.self) { date in
                if date.isSameDayAs(dateHolder.date) {
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundColor(Color.red.opacity(0.5))
                            .frame(height: 30)
                        Text(date.currentDay())
                            .dayOfWeek()
                    }
                } else {
                    Text(date.currentDay())
                        .dayOfWeek()
                }
            }
//            wholeWeek.forEach { datee in
//                Text(datee.currentDay())
//            }
        }
        .frame(height: 40)
//        .padding(10)
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
