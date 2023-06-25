//
//  Helper.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 24/06/23.
//

import AppKit
import SwiftUI


let screenDimensions = NSScreen.main?.visibleFrame.size

let screenHeight = screenDimensions?.height ?? 200
let screenWidth = screenDimensions?.width ?? 300

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
    
    func isSameDayAs(_ anotherDate: Date) -> Bool {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        return dateFormat.string(from: self) == dateFormat.string(from: anotherDate)
    }
    
    
}

extension TextField {
    func makeDefaultDesign(bgColor: Color = Color(.textBackgroundColor)) -> some View {
        return self
            .textFieldStyle(PlainTextFieldStyle())
            .padding(5)
            .background(bgColor)
            .textFieldStyle(PlainTextFieldStyle())
            .cornerRadius(8)
            .shadow(radius: 8)
            .animation(.none)
    }
}
