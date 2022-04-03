//
//  RadialGradientView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct RadialGradientView: View {
    var body: some View {
        VStack {
            Text("Hello world")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(
                colors: [
                    Color.purple,
                    Color.orange
                ],
                center: .center,
                startRadius: 1,
                endRadius: 500
            )
        )
    }
}

struct RadialGradientView_Previews: PreviewProvider {
    static var previews: some View {
        RadialGradientView()
    }
}
