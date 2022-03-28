//
//  PinnedView.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct PinnedView: View {
    
    let columns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders]) {
            ForEach(1..<11) { section in
                Section(header: Text("Section \(section)")) {
                    ForEach(1..<Int.random(in: 5...10)){ index in
                        Text("Item \(index)")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct PinnedView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedView()
    }
}
