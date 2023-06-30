//
//  TimeLineDemoView.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 22/06/23.
//


import SwiftUI

struct Event: Identifiable, Decodable {
    var id: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "ddMMMYY"
        let eventStr = dateFormat.string(from: eventDay)
        
        dateFormat.dateFormat = "hmm"
        let startHour = dateFormat.string(from: startTime)
        let endHour = dateFormat.string(from: endTime)
        
        return eventStr+startHour+endHour
    }
    var startTime: Date
    var endTime: Date
    var title: String
    var eventDay: Date
    var metaData: Event_Data
}

extension Date {
    static func dateFrom(_ day: Int, _ month: Int, _ year: Int, _ hour: Int, _ minute: Int) -> Date {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute)
        return calendar.date(from: dateComponents) ?? Date()
    }
}

extension Int {
    func getEventTime() -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "H:mm"
        
        let strTime = "\(self):00"
        let calDate = dateFormat.date(from: strTime)!
        
        return calDate
    }
}

struct CalendarComponent: View {

    let arrayHours = CalendarHelper.shared.getArrayOfHours
    @EnvironmentObject var selectedDate: SelectedDate
    
    @State var isPopOver = false
    
    let allEvents: [Event]      // Fetchd Events From API
    
//    let events: [Event] = [
//        .init(startTime: arrayHours[0], endTime: arrayHours[1], title: "Demo Event", eventDay: selectedDate.date),
//        .init(startTime: arrayHours[3], endTime: arrayHours[4], title: "Second Demo Event", eventDay: selectedDate.date)
//    ]

//    let events: [Event] = [
//        Event(startTime: .dateFrom(9, 5, 2023,  9, 15), endTime: .dateFrom(9, 5, 2023, 10, 15), title: "Event 1"),
//        Event(startTime: .dateFrom(9, 5, 2023,  9,  0), endTime: .dateFrom(9, 5, 2023, 10,  0), title: "Event 2"),
//        Event(startTime: .dateFrom(9, 5, 2023, 11,  0), endTime: .dateFrom(9, 5, 2023, 12, 00), title: "Event 3"),
//        Event(startTime: .dateFrom(9, 5, 2023, 13,  0), endTime: .dateFrom(9, 5, 2023, 14, 45), title: "Event 4"),
//        Event(startTime: .dateFrom(9, 5, 2023, 15,  0), endTime: .dateFrom(9, 5, 2023, 15, 45), title: "Event 5")
//    ]

    let calendarHeight: CGFloat // total height of calendar

    private var hourHeight: CGFloat {
        return calendarHeight /  CGFloat(arrayHours.count) // CGFloat( endHour - startHour + 1)
    }

    var body: some View {
        List() {
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0) {
                    ForEach(arrayHours, id: \.self) { hour in
                        HStack(spacing: 10) {
                            Text(hour.getHourStr())
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .frame(width: 50, height: 20, alignment: .center)
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.5))
                                .frame(height: 1)
                        }
                        .frame(height: hourHeight, alignment: .top)
                    }
                }
                
                ForEach(allEvents) { event in
                    if event.eventDay.isSameDayAs(selectedDate.date) {
                        eventCell(event, hourHeight: hourHeight)
                            .onTapGesture {
                                isPopOver.toggle()
                                debugPrint("Event Name - \(event.id)")
                            }
                    }
                }
                .disabled(false)
                .frame(alignment: .top)
                .offset(x: 60, y: 0)
            }
        }
//        .frame(maxWidth: screenHeight, alignment: .bottom)
        .frame(minWidth: screenWidth*0.5, alignment: .bottom)
        .padding()
        .cornerRadius(8)
        .shadow(radius: 8)
        .background(Color.clear)
    }

    private func eventCell(_ event: Event, hourHeight: CGFloat) -> some View {
        // When StartTime and EndTime is Int
//        var duration: Int { event.endTime - event.startTime }
//        var height: Double { CGFloat(duration) * hourHeight }
        
        var duration: Double {
            debugPrint("DUration = \(event.endTime.timeIntervalSince(event.startTime))")
            return event.endTime.timeIntervalSince(event.startTime) }
        var height: Double { (duration / 60 / 60) * hourHeight }

        let calendar = Calendar.current

        var hour: Int {
            debugPrint("Starting Date === \(event.startTime)")
            debugPrint("Starting Hour = \(calendar.component(.hour, from: event.startTime))")
            return calendar.component(.hour, from: event.startTime)
        }
        var minute: Int {
            debugPrint("Starting Minute = \(calendar.component(.minute, from: event.startTime))")
            return calendar.component(.minute, from: event.startTime)
        }

        // hour + minute + padding offset from top
        var offset: Double {
            debugPrint("OffSet = \(((CGFloat(hour) * hourHeight) + (CGFloat(minute / 60) * hourHeight) + 15))")
            return ((CGFloat(hour) * hourHeight) + (CGFloat(minute / 60) * hourHeight) + 15)
        }
        
        // When Int
//        var offset: Double {
//            (CGFloat(event.startTime) + 10)
//        }

        return Text(event.title)
            .bold()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: height-10)
            .contentShape(Rectangle())
            .onTapGesture {
                self.isPopOver.toggle()
                debugPrint("Event Name = \(event.title) and ID = \(event.id)")
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue.opacity(0.2))
                    .padding(.trailing, 60)
                    .shadow(radius: 10)
                    .popover(isPresented: self.$isPopOver) {
                        EventDetailView(eventData: event.metaData)
                    }
            )
            .shadow(radius: .zero)
            .offset(y: offset)
    }
}
