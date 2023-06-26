//
//  DateHolder.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import Foundation

class DateHolder: ObservableObject {
    @Published var date = Date()    // Today's Date
}

class SelectedDate: ObservableObject {
    @Published var date = Date()    // Selected Date
}
