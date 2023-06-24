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
    var body: some View {
        VStack {
            Button(action: { self.isPopover.toggle() }) {
                Image(nsImage: NSImage(named: NSImage.infoName) ?? NSImage())
            }.popover(isPresented: self.$isPopover, arrowEdge: .bottom) {
                     PopoverView()
            }.buttonStyle(PlainButtonStyle())
        }.frame(height: 60)
            .frame(maxWidth: .infinity)
        VStack(spacing: 10) {
            DateScrollerView().environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
            calendarGrid
            CalendarComponent(calendarHeight: 24 * 40)
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
struct PopoverView: View {
    @State private var eventTitle: String = ""
    
    var body: some View {
        Text("Add Event Details")
            .font(Font.title.weight(.semibold))
            .animation(.none)
            .frame(maxWidth: .infinity)
            .padding()
        Divider()
        VStack(spacing: 10) {
            TextField("Event Name", text: $eventTitle)
            Button("Resume") {
                debugPrint("Button Click..")
            }
        }
        .padding()
        .frame(width: screenWidth*0.3)
    }
}
