//
//  TimeLineViewExample.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct TimeLineViewExample: View {
    var body: some View {
        VStack {
            TimelineView(PeriodicTimelineSchedule(from: Date(), by: 1)) { context in
                Text("\(context.date)")
            }
        }
    }
}

struct TimeLineViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineViewExample()
    }
}
