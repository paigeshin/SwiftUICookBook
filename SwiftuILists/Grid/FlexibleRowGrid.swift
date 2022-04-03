//
//  FlexibleRowGrid.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct FlexibleRowGrid: View {
    
    // Try best to fit with columns
    let columns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1...21, id: \.self) { index in
                Text("Item \(index)")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
        }
    }
}

struct FlexibleRowGrid_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleRowGrid()
    }
}
