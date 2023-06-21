//
//  DateScrollerView.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 21/06/23.
//

import SwiftUI

struct DateScrollerView: View {
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(action: previousWeek) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
            Text(CalendarHelper.shared.monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: nextWeek) {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }
    }
    
    func previousWeek() {
        dateHolder.date = CalendarHelper.shared.minusWeek(dateHolder.date)
    }
    
    func nextWeek() {
        dateHolder.date = CalendarHelper.shared.plusWeek(dateHolder.date)
    }
    
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}
