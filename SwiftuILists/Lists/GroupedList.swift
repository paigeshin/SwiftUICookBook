//
//  GroupedList.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

fileprivate struct Item: Identifiable {
    let id = UUID()
    let title: String
    let subitems: [SubItem]
}

fileprivate struct SubItem: Identifiable {
    let id = UUID()
    let title: String
}

struct GroupedList: View {
    
    fileprivate let settings = [
        Item(title: "Item #1", subitems: [
            SubItem(title: "Subitem 1 for Item 1"),
            SubItem(title: "Subitem 2 for Item 1"),
        ]),
        Item(title: "Item #2", subitems: [
            SubItem(title: "Subitem 1 for Item 2"),
            SubItem(title: "Subitem 2 for Item 2"),
        ])
    ]
    
    var body: some View {
        List {
            ForEach(settings) { post in
                Section(header: Text(post.title)) {
                    ForEach(post.subitems) { comment in
                        Text(comment.title)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct GroupedList_Previews: PreviewProvider {
    static var previews: some View {
        GroupedList()
    }
}
