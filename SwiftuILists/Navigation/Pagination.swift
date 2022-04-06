//
//  Pagination.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct Pagination: View {
    var body: some View {
        TabView {
            Text("One")
            Text("Two")
            Text("Three")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct Pagination_Previews: PreviewProvider {
    static var previews: some View {
        Pagination()
    }
}
