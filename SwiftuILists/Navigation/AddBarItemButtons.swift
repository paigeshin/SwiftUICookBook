//
//  AddBarItemButtons.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct AddBarItemButtons: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
            }
            .navigationTitle("Customers")
            .navigationBarItems(leading:
                                    Button(action: {}, label: { Image(systemName: "house") }),
                                trailing: Button(action: {}, label: { Image(systemName: "bolt") }))
        }
    }
}

struct AddBarItemButtons_Previews: PreviewProvider {
    static var previews: some View {
        AddBarItemButtons()
    }
}
