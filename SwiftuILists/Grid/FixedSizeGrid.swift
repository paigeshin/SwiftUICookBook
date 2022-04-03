//
//  FixedSizeGrid.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct FixedSizeGrid: View {
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
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

struct FixedSizeGrid_Previews: PreviewProvider {
    static var previews: some View {
        FixedSizeGrid()
    }
}
