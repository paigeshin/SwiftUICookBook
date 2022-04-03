//
//  GeometryEffect.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct GeometryEffectFlip: View {
    
    @Namespace private var animation
    @State private var isFlipped = false 
    
    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
                Text("Paige Shin - 1991")
                    .font(.headline)
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
            } else {
                Text("Paige Shin - 1991")
                    .font(.headline)
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                self.isFlipped.toggle()
            }
        }
    }
}

struct GeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        GeometryEffectFlip()
    }
}
