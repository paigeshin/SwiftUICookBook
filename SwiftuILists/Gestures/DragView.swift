//
//  DragView.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/31.
//

import SwiftUI

struct DragView: View {
    
    @State private var position: CGPoint = .zero
    @State private var danger: Bool = false
    @State private var isDragging: Bool = false
    
    var body: some View {
        VStack {
            Image("cat")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .zIndex(1)
                .position(isDragging ? position : .zero)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            isDragging = true
                            position = value.location
                            
                            if position.y > UIScreen.main.bounds.height / 2 {
                                danger = true
                            } else {
                                danger = false
                            }
                            
                        })
                        .onEnded({ value in
                            isDragging = false
                            position = .zero
                            danger = false
                        })
                )
            HStack {
                Text("Danger")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(danger ? Color.red : Color.green)
            
        }
    }
    
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
