//
//  OptionalBindingView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct OptionalBindingView: View {
    
    let name: String? = "Paige Shin"

    var body: some View {
        VStack {
            Text(name!) // NOT RECOMMENDED
            Text(name ?? "")
            name.map {
                Text($0)
            }
            if let name: String = name {
                Text(name)
            }
        }
    }
}

struct OptionalBindingView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalBindingView()
    }
}
