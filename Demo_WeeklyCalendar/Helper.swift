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

extension TextField {
    func makeDefaultDesign(bgColor: Color = Color(.darkGray)) -> some View {
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
