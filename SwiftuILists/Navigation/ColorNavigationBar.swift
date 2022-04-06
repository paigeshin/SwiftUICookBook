//
//  ColorNavigationBar.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct ColorNavigationBar: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.blue
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("List of Plants")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            .navigationTitle("Plants")
            .ignoresSafeArea()
        }
    }
}

struct ColorNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        ColorNavigationBar()
    }
}
