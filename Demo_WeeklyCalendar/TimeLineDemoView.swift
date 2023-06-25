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
        dateFormat.dateFormat = "ddMMMYY_hmm"
        let startStr = dateFormat.string(from: startTime)
        let endStr = dateFormat.string(from: endTime)
        return startStr+endStr
    }
    var startTime: Date
    var endTime: Date
    var title: String
}

extension Date {
    static func dateFrom(_ day: Int, _ month: Int, _ year: Int, _ hour: Int, _ minute: Int) -> Date {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute)
        return calendar.date(from: dateComponents) ?? Date()
    }
}

struct CalendarComponent: View {

    let arrayHours = CalendarHelper.shared.getArrayOfHours
    
    let allEvents: [Event]      // Fetchd Events From API

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
                    eventCell(event, hourHeight: hourHeight)
                        .onTapGesture {
                            debugPrint("Event Name - \(event.id)")
                        }
                }
                .disabled(false)
                .frame(alignment: .top)
                .offset(x: 60, y: 0)
            }
        }
        .frame(maxWidth: screenHeight, alignment: .bottom)
        .cornerRadius(8)
        .shadow(radius: 8)
        .background(Color.clear)
    }

    private func eventCell(_ event: Event, hourHeight: CGFloat) -> some View {
        var duration: Double { event.endTime.timeIntervalSince(event.startTime) }
        var height: Double { (duration / 60 / 60) * hourHeight }

        let calendar = Calendar.current

        var hour: Int { calendar.component(.hour, from: event.startTime) }
        var minute: Int { calendar.component(.minute, from: event.startTime) }

        // hour + minute + padding offset from top
        var offset: Double {
            ((CGFloat(hour) * hourHeight) + (CGFloat(minute / 60) * hourHeight) + 15)
        }

        return Text(event.title)
            .bold()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: height-10)
            .contentShape(Rectangle())
            .onTapGesture {
                debugPrint("Event Name = \(event.title) and ID = \(event.id)")
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.red.opacity(0.2))
                    .padding(.trailing, 60)
                    .shadow(radius: 10)
            )
            .shadow(radius: .zero)
            .offset(y: offset)
    }
}
