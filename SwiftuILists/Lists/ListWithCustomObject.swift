//
//  ListWithCustomObject.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

fileprivate struct Friend {
    let name: String
}

struct ListWithCustomObject: View {
    fileprivate let friends = [
        Friend(name: "John"),
        Friend(name: "Marry"),
        Friend(name: "Steven"),
    ]
    
    var body: some View {
        // List with Range Operator
        List(friends, id: \.name) { friend in
            Text(friend.name)
        }
    }
}

struct ListWithCustomObject_Previews: PreviewProvider {
    static var previews: some View {
        ListWithCustomObject()
    }
}
