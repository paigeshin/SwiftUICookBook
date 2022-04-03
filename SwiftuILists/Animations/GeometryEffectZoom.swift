//
//  GeometryEffectZoom.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct GeometryEffectZoom: View {
    
    @Namespace private var animation
    @State private var isZoomed = false
    
    var frame: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)
                    
                    if !isZoomed {
                        Text("Paige shin - 1991")
                            .font(.headline)
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    
                        Spacer()
                    }
                }
            }
            
            if isZoomed {
                Text("Paige shin - 1991")
                    .font(.headline)
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .padding(.bottom, 60)
                Spacer()
            }
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.isZoomed.toggle()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: isZoomed ? 400 : 60)
        .background(Color(white: 0.9))
    }
}

struct GeometryEffectZoom_Previews: PreviewProvider {
    static var previews: some View {
        GeometryEffectZoom()
    }
}
