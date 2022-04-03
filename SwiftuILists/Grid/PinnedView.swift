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
    
    private func headerView(_ index: Int) -> some View {
        Text("Section \(index)")
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders]) {
                    ForEach(1..<11) { section in
                        Section(header: headerView(section)) {
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
            .navigationTitle("Pinned Views Demo")
        }

    }
}

struct PinnedView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedView()
    }
}
