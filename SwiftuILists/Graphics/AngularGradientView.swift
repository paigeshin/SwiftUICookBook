//
//  AngularGradientView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct AngularGradientView: View {
    var body: some View {
        VStack {
            Text("Hello world")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            AngularGradient(
                gradient: Gradient(colors: [
                    Color.red,
                    Color.blue,
                    Color.purple,
                    Color.green,
                    Color.orange
                ]),
                center: .center
            )
        )
    }
}

struct AngularGradientView_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientView()
    }
}
