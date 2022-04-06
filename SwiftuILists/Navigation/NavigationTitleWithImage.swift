//
//  NavigationTitleWithImage.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct NavigationTitleWithImage: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("List of Plants")
            }
            .navigationTitle("Plants")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct NavigationTitleWithImage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTitleWithImage()
    }
}
