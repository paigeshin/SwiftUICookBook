//
//  ListWithIndices.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

fileprivate struct Friend {
    let name: String
}

struct ListWithIndices: View {
    fileprivate let friends = [
        Friend(name: "John"),
        Friend(name: "Marry"),
        Friend(name: "Steven"),
    ]
    
    var body: some View {
        // List with Range Operator
        List(friends.indices) { index in
            let friend = friends[index]
            HStack {
                Text("\(index + 1)")
                Text(friend.name)
            }
        }
    }
}

struct ListWithIndices_Previews: PreviewProvider {
    static var previews: some View {
        ListWithIndices()
    }
}
