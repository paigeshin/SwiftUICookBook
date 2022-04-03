//
//  RoundedCornersView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct RoundedCornersView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello World")
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(10.0)
            .foregroundColor(.white)
        }
    }
}

struct RoundedCornersView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersView()
    }
}
