//
//  VisualEffectView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    
    var effect: UIVisualEffect?
    typealias UIViewType = UIVisualEffectView
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
    
}

struct DisplayVisualEffectView: View {
    
    var body: some View {
        
        ZStack {
            Image("cat")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .ignoresSafeArea()
            
            Text("SKY")
                .font(.largeTitle)
                .foregroundColor(.white)
//                .frame(maxWidth: 300, maxHeight: 300)
                // background materials => see through
//                .background(.ultraThinMaterial)
 
        }
        
    }
    
}

struct VisualEffectView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayVisualEffectView()
    }
}
