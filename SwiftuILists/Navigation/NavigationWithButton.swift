//
//  NavigationWithButton.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct NavigationWithButton: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(isActive: $isActive) {
                    Text("Detail View")
                } label: {
                    Button("Go to Detail View") {
                        isActive = true
                    }
                }
            }
        }
    }
    
}

struct NavigationWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationWithButton()
    }
}
