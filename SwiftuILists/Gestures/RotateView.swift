//
//  RotateView.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/31.
//

import SwiftUI

struct RotateView: View {
    
    @State private var degrees: Double = 0.0
    
    var body: some View {
        VStack {
            
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(degrees))
                .padding(.top, 50)
                .animation(.default, value: degrees)
            
            Spacer()
            
            Button("Rotate") {
                degrees += 90
            }
            
        }
        .padding()
    }
    
    
}

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView()
    }
}
