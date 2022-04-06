//
//  RoundedCorerWithClipShape.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct RoundedCorerWithClipShape: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello World")
            }
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            // .continous => smooth rounded corner
            .foregroundColor(.white)
        }
    }
    
}

struct RoundedCorerWithClipShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorerWithClipShape()
    }
}
