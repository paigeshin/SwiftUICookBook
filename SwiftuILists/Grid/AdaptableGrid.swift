//
//  AdaptableGrid.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct AdaptableGrid: View {
    
    // Adapt to different screen sizes
    // Fill remaining space even if column rows are specified as two 
    let columns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1...20, id: \.self) { index in
                Text("Item \(index)")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
        }
    }
}

struct AdaptableGrid_Previews: PreviewProvider {
    static var previews: some View {
        AdaptableGrid()
    }
}
