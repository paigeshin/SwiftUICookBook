//
//  GeometryCard.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/02.
//

import SwiftUI

struct GeometryCard: View {
    
    @Namespace var heroAnimation: Namespace.ID
    @State var clicked: Bool = false
    
    var body: some View {
        ZStack {
            
            if !clicked {
                VStack {
                    HStack(spacing: 16) {
                        Image("cat")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .cornerRadius(100)
                            .matchedGeometryEffect(id: "image", in: heroAnimation)
                            
                    
                        Text("Cat Lover")
                            .font(.title2.bold())
                            .matchedGeometryEffect(id: "title", in: heroAnimation)
                        
                        Spacer()
                    
                    }
                    .padding()
                    
                    Spacer()
                    
                }
            } else {
                VStack {
                    Image("cat")
                        .resizable()
                        .frame(width: 240, height: 240)
                        .cornerRadius(100)
                        .matchedGeometryEffect(id: "image", in: heroAnimation)
                
                    Text("Cat Lover")
                        .font(.title.bold())
                        .matchedGeometryEffect(id: "title", in: heroAnimation)
                    
                    Spacer()
                
                }
            }
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                clicked.toggle()
            }
        }
    }
}

struct GeometryCard_Previews: PreviewProvider {
    static var previews: some View {
        GeometryCard()
    }
}
