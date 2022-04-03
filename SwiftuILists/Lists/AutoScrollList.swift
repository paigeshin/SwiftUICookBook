//
//  AutoScrollList.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct AutoScrollList: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Scroll to 100") {
                    withAnimation {
                        proxy.scrollTo(150)
                    }
                }
                List(1...500, id: \.self) { index in
                    Text("\(index)")
                        .id(index)
                }
            }
        }
        .colorScheme(.light)
    }
}

struct AutoScrollList_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrollList()
    }
}

