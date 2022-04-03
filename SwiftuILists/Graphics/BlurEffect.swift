//
//  BlurEffect.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI



struct BlurEffect: View {
    var body: some View {
        ZStack {
            
            Image("cat")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 20.0)
            
            Text("SKY")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct BlurEffect_Previews: PreviewProvider {
    static var previews: some View {
        BlurEffect()
    }
}
