//
//  CreateActions.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct CreateActions: View {
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                Text("\(index)")
                    .swipeActions(edge: .leading) {
                        Button {
                            //action
                        } label: {
                            if index % 2 == 0 {
                                Label("Read", systemImage: "envelop.open")
                            } else {
                                Label("Unread", systemImage: "envelop.badge")
                            }
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            // action
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
        }
    }
}

struct CreateActions_Previews: PreviewProvider {
    static var previews: some View {
        CreateActions()
    }
}
