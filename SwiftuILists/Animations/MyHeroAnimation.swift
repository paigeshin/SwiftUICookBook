//
//  HeroAnimation.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct MyHeroAnimation: View {
    
    @Namespace var heroAnimation
    @State var showAnimation = false
    var fontSize: CGFloat {
        showAnimation ? 76 : 16
    }
    
    var body: some View {
        
        ZStack {
            
            if showAnimation {
                
                Text("Paige Company")
                    .matchedGeometryEffect(id: "Text", in: heroAnimation)
                    .font(.system(size: fontSize))
                    .id("Page Company")
            } else {
                
                Text("Paige Company")
                    .matchedGeometryEffect(id: "Text", in: heroAnimation)
                    .font(.system(size: fontSize))
                    .id("Page Company")
                
            }
            
        }
        .onAppear {
            withAnimation(.spring()) {
                showAnimation.toggle()
            }
        }
        
    }
}

struct MyHeroAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MyHeroAnimation()
    }
}
