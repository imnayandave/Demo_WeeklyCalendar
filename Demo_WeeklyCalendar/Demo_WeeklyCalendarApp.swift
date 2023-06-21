//
//  Demo_WeeklyCalendarApp.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import SwiftUI

@main
struct Demo_WeeklyCalendarApp: App {
    
    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            ContentView()
                .environmentObject(dateHolder)
        }
    }
}
