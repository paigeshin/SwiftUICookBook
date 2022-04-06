//
//  SegmentedControlView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/07.
//

import SwiftUI

struct SegmentedControlView: View {
    
    @State private var selection: String = "Student"
    
    var body: some View {
        VStack {
            
            Picker("Select", selection: $selection) {
                Text("Student").tag("Student")
                Text("Staff").tag("Staff")
                Text("Faculty").tag("Faculty")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text(selection)
            
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
