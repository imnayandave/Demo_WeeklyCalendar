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
    
    @State var allEventData = [Event_Data]()
    @State var showableEvent = [Event]()
    
    
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
            CalendarComponent(allEvents: showableEvent, calendarHeight: 24 * 40)
//                .padding(.top, 10)
        }.onAppear(perform: {
            self.call_GetEvent_API()
        })
//        .padding(10)
        .frame(minWidth: screenWidth*0.5, minHeight: screenHeight*0.75)
//        .cornerRadius(10)
//        .shadow(radius: 10)
    }
    
    private func call_GetEvent_API() {
        NetworkClient.networkRequest { (isSuccess, response: All_Event_Response_Modal?, errorMessage) in
            if isSuccess, let response = response {
                guard let mainData = response.data else {
                    show_Error_Alert(response.message ?? "No Data From API")
                    return
                }
                allEventData = mainData.list ?? []
                debugPrint("DATA FETCHED...")
                get_All_Event_Dates()
            } else if let errorMessage = errorMessage {
                show_Error_Alert(errorMessage)
            } else {
                show_Error_Alert("Unknown Error Occured!")
            }
        }
    }
    
    private func get_All_Event_Dates() {
        var arrEvent = [Event]()
        self.allEventData.forEach { event in
            let fromDate = CalendarHelper.shared.convert_EventStr_Date(event.eventFromDate.non_Nil_String())
            let toDate = CalendarHelper.shared.convert_EventStr_Date(event.eventToDate.non_Nil_String())
            
            debugPrint("From Date = \(fromDate)\n To Date = \(toDate)")
            
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a" // "a" prints "pm" or "am"
            
            debugPrint("Hourr1 = \(formatter.string(from: fromDate)), Hour2 == \(formatter.string(from: toDate))")
            
            arrEvent.append(Event(startTime: fromDate, endTime: toDate, title: event.eventSubject.non_Nil_String(), eventDay: fromDate, metaData: event))
        }
        showableEvent = arrEvent
    }
    
    private func show_Error_Alert(_ error: String) {
        let alert = NSAlert()
        alert.messageText = "Oops!"
        alert.informativeText = "Follwing Error Occured:\n\"\(error)\""
        alert.alertStyle = NSAlert.Style.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
