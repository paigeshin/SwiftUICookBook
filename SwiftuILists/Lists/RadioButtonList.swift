//
//  RadioButtonList.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct RadioButtonList: View {
    
    @State private var selectedChoice: String = ""
    let choices = ["Student", "Staff", "Faculty"]
    
    var body: some View {
        List(choices, id: \.self) { choice in
            HStack {
                Text(choice)
                Spacer()
                // circle.inset.filled
                Image(systemName: selectedChoice == choice ? "smallcircle.fill.circle" : "circle")
                    .onTapGesture {
                        selectedChoice = choice
                    }
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct RadioButtonList_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonList()
    }
}
