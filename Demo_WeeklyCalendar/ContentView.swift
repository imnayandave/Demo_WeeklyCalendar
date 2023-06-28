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
                allEventData = response.data.list
                debugPrint("DATA FETCHED...")
            } else if let errorMessage = errorMessage {
                show_Error_Alert(errorMessage)
            } else {
                show_Error_Alert("Unknown Error Occured!")
            }
        }
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
