//
//  LazyVStackList.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct LazyVStackList: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...20, id: \.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(index)")
                            Divider()
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color.red)
        }
        .background(Color.brown)
    }
}

struct LazyVStackList_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackList()
    }
}
