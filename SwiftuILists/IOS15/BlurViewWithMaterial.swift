//
//  BlurViewWithMaterial.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct BlurViewWithMaterial: View {
    let posterURL = URL(string: "https://i.pinimg.com/originals/d9/39/8a/d9398a3673bf94ea6a9ca877e42203e9.jpg")!
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: posterURL)
            
            
            HStack {
                Text("Movie")
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        
        
    }
}

struct BlurViewWithMaterial_Previews: PreviewProvider {
    static var previews: some View {
        BlurViewWithMaterial()
    }
}
