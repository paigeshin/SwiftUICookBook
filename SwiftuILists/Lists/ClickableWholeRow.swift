//
//  ClickableRow.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct ClickableWholeRow: View {
    
    @State private var selectedIndex: Int?
    
    var body: some View {
        
        VStack {
            List {
                ForEach(1...10, id: \.self) { index in
                    HStack {
                        Text("\(index)")
                        Spacer()
                    }
                    //Entirely Clickable
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedIndex = index
                    }
                }
            }
            
            selectedIndex.map {
                Text("\($0)")
                    .font(.largeTitle)
            }
            
        }
        
    }
}

struct ClickableRow_Previews: PreviewProvider {
    static var previews: some View {
        ClickableWholeRow()
    }
}
