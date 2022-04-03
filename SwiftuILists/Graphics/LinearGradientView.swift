//
//  GraidentView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        VStack {
            Text("Hello world")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }
}

struct GraidentView_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientView()
    }
}
