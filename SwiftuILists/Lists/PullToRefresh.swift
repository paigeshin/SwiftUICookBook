//
//  PullToRefresh.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct PullToRefresh: View {
    
    @State private var refreshDates: [Date] = []
    
    var body: some View {
        NavigationView {
            List(refreshDates, id: \.self) { data in
                Text("\(data)")
            }
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    let currentDate = Date()
                    refreshDates.append(currentDate)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pull To Refresh")
        }
    }
}

struct PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefresh()
    }
}
