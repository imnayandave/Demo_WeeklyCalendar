//
//  ContentView.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @EnvironmentObject var selectedDate: SelectedDate
    
    @State var isPopover = false
    
    let demoHours = CalendarHelper.shared.getArrayOfHours
    
    
    var body: some View {
//        VStack {
//            Button(action: { self.isPopover.toggle() }) {
//                Image(nsImage: NSImage(named: NSImage.infoName) ?? NSImage())
//            }.popover(isPresented: self.$isPopover, arrowEdge: .bottom) {
//                     EventDetailView()
//            }.buttonStyle(PlainButtonStyle())
//        }.frame(height: 40)
//            .frame(maxWidth: .infinity)
        VStack(spacing: 10) {
            DateScrollerView().environmentObject(dateHolder)
            dayOfWeekStack
            DatesOfWeek()
            CalendarComponent(allEvents: [
                .init(startTime: demoHours[0], endTime: demoHours[1], title: "Demo Event", eventDay: selectedDate.date),
                .init(startTime: demoHours[3], endTime: demoHours[4], title: "Second Demo Event", eventDay: selectedDate.date)
            ], calendarHeight: 24 * 40)
                .padding(.top, 10)
        }
        .padding(10)
        .frame(minWidth: screenWidth*0.5, minHeight: screenHeight*0.75)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
