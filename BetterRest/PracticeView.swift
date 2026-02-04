//
//  PracticeView.swift
//  BetterRest
//
//  Created by Eli J on 1/19/26.
//

import SwiftUI

struct PracticeView: View {
    @State private var wakeUp1 = Date.now
    @State private var sleepAmount1 = 8.0

    var body: some View {
        VStack{
            Stepper("\(sleepAmount1.formatted()) hours",
                    value: $sleepAmount1,
                    in: 4...12,
                    step: 0.2)
            
            DatePicker("Please enter a date",
                       selection: $wakeUp1,
                       in: Date.now... ,
                       displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            Text(Date.now, format: .dateTime.day().month().year())
            
            Text(Date.now, format: .dateTime.hour().minute())
            
            Text(wakeUp1.formatted(date: .long, time: .standard))
        }
        .padding()
    }
    
    func exampleDates() {
        /* The following is not feasible because not all days are 86400 sec...
            let now = Date.now
            let tomorrow = Date.now.addingTimeInterval(86400)
            let range = now...tomorrow
         Do this instead: Make use of `DateComponents()`... */
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    PracticeView()
}
