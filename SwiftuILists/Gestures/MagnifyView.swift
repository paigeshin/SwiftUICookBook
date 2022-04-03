//
//  MagnifyView.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct MagnifyView: View {
    
    @State private var currentScale: CGFloat = 1.0
    @GestureState private var zoomFactor: CGFloat = 2.0
    
    var magnification: some Gesture {
        return MagnificationGesture()
            .updating($zoomFactor) { value, scale, transaction in
                withAnimation {
                    scale = value
                }
            }
            .onChanged { value in
                withAnimation {
                    currentScale += value
                }
            }
            .onEnded { value in
                // do nothing
            }
    }
    
    var body: some View {
        Image("cat")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(zoomFactor * currentScale)
            .gesture(magnification)
    }
}

struct MagnifyView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyView()
    }
}
