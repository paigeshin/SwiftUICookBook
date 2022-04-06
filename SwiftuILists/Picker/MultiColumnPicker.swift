//
//  MultiColumnPicker.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/07.
//

import SwiftUI

struct MultiColumnPicker: View {
    
    @State private var selectedHour: Int = 0
    @State private var selectedMinute: Int = 0
    
    var selectedTime: Date? {
        var calendarDateComponents: DateComponents = Calendar.current.dateComponents([.day, .year, .month], from: Date())
        calendarDateComponents.hour = selectedHour
        calendarDateComponents.minute = selectedMinute
        let current: Date? = Calendar.current.date(from: calendarDateComponents)
        return current
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("Hour")
                        Picker("Hour", selection: $selectedHour) {
                            ForEach(1...12, id: \.self) { hour in
                                Text("\(hour)")
                                    .tag(hour)
                            }
                        }
                        .frame(width: proxy.size.width / 3)
                        .pickerStyle(WheelPickerStyle())
                        .clipped()
                    } //: VSTACK

                    VStack {
                        Text("Minute")
                        Picker("Minute", selection: $selectedMinute) {
                            ForEach(1...60, id: \.self) { minute in
                                Text("\(minute)")
                                    .tag(minute)
                            }
                        }
                        .frame(width: proxy.size.width / 3)
                        .pickerStyle(WheelPickerStyle())
                        .clipped()
                    } //: VSTACK
                    Spacer()
                } //: HSTACK
                
                selectedTime.map {
                    Text("\($0)")
                        .fontWeight(.bold)
                }
                
                
            } //: VSTACK
            
        }

    }
}

struct MultiColumnPicker_Previews: PreviewProvider {
    static var previews: some View {
        MultiColumnPicker()
    }
}
