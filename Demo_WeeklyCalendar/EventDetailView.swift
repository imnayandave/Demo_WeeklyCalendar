//
//  EventDetailView.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 24/06/23.
//

import SwiftUI
import AppKit

struct EventDetailView: View {
    
    let eventData: Event_Data
    
    @State private var eventTitle: String = ""
    @State private var eventDesc: String = ""
    
    let arrHoursDate = CalendarHelper.shared.getArrayOfHours
    let arrHourStr = CalendarHelper.shared.getArrayOfHours.map { $0.getHourStr() }
    
    @State private var startTime: String?
    @State private var endTime: String?
    
    var body: some View {
        Text("All Event Details")
            .font(Font.title.weight(.semibold))
            .animation(.none)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        Divider()
            .padding(.horizontal, 10)
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 5) {
                Text("Meeting Type : ")
                Text(eventData.meetingTypeName.non_Nil_String()).default_BackView()
                Spacer()
                Text("Created By : ")
                Text(eventData.createdForUserName.non_Nil_String()).default_BackView()
            }
            
            HStack(spacing: 5) {
                Text("Subject : ")
                Text(eventData.eventSubject.non_Nil_String()).default_BackView()
                Spacer()
                Text("Duration : ")
                Text(eventData.duration.non_Nil_String()).default_BackView()
            }
            
            HStack(spacing: 5) {
                Text("From Time : ")
                Text(CalendarHelper.shared.convert_EventStr_Date(eventData.eventFromDate.non_Nil_String()).getHourStr())
                    .default_BackView()
                Spacer()
                Text("To Time : ")
                Text(CalendarHelper.shared.convert_EventStr_Date(eventData.eventToDate.non_Nil_String()).getHourStr())
                    .default_BackView()
            }
            
            HStack(spacing: 10) {
                Text("Location : ")
                Text(eventData.locationName.non_Nil_String() + " , " + eventData.eventLocation.non_Nil_String())
            }
            
            
//            TextField("Event Name", text: $eventTitle)
//                .makeDefaultDesign()
//            TextField("Event Description (optional)", text: $eventDesc)
//                .makeDefaultDesign()
//            HStack{
//                HStack(alignment: .center, spacing: 10) {
//                    Text("Staring Time: ")
//                        .font(Font.body.weight(.semibold))
//                        .padding(5)
//                    Picker("Start Time", selection: $startTime) {
//                        Text("Select Time").tag(Optional<String>(nil))
//                        ForEach(arrHourStr, id: \.self) { hour in
//                            Text(hour).tag(Optional(hour))
//                        }
//                    }
//                    .shadow(radius: 8)
//                    .labelsHidden()
//                    .frame(width: 120)
//                }
//                Spacer()
//                HStack(alignment: .center, spacing: 10) {
//                    Text("Ending Time: ")
//                        .font(Font.body.weight(.semibold))
//                        .padding(5)
//                    Picker("Ending Time Picker", selection: $endTime) {
//                        Text("Select Time").tag(Optional<String>(nil))
//                        ForEach(arrHourStr, id: \.self) { hour in
//                            Text(hour).tag(Optional(hour))
//                        }
//                    }
//                    .shadow(radius: 8)
//                    .labelsHidden()
//                    .frame(width: 120)
//                }
//            }
//            Button("Add Event") {
//                debugPrint("Button Click..")
//            }
//            .padding(.horizontal, 10)
//            .padding(.vertical, 5)
//            .background(Color.blue)
//            .foregroundColor(Color.white)
//            .buttonStyle(PlainButtonStyle())
//            .cornerRadius(8)
//            .shadow(radius: 8)
        }
        .padding()
        .frame(width: screenWidth*0.4)
    }
}
