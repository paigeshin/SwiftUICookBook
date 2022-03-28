//
//  GridViewBasic.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

/*
 
 https://blog.logrocket.com/understanding-the-swiftui-grid-layout/
 
 Fixed — The element is fixed in size no matter the orientation or screen size of the device
 Flexible — The element is flexible enough to resize itself according to the space available
 Adaptive — The element can adapt to the screen size or orientation, with a minimum width or height provided. For example, it can be two columns on iPhone, but on iPad, it adapts to the given size and makes it three columns
 
 */

struct GridViewBasic: View {
    
    // fixed width 100
//    let columns = [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    // flexible => try their best to fill the empty space
    // minimum width 50
    //let columns = [GridItem(.flexible(minimum: 50)),GridItem(.flexible(minimum: 50)),GridItem(.flexible(minimum: 50))]
    
    // adaptive => A depth of columns will allow you to adapt to different screen sizes
    // great for landscape
    // column rows may change according to screen size
    let columns = [GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1...20, id: \.self) { index in
                HStack {
                    Text("Item \(index)")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                }
            }
        }
    }
}

struct GridViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridViewBasic()
            GridViewBasic()
                .previewLayout(.fixed(width: 480, height: 320))
        }
        
        
    }
}
