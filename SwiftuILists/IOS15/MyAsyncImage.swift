//
//  MyAsyncImage.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct MyAsyncImage: View {
    let posterURL = URL(string: "https://i.pinimg.com/originals/d9/39/8a/d9398a3673bf94ea6a9ca877e42203e9.jpg")!
    
    var body: some View {
        AsyncImage(url: posterURL) { phase in
            if let image = phase.image {
                image
            } else if phase.error != nil {
                Image(systemName: "exclamationmark.circle")
            } else {
                Image(systemName: "photo")
            }
        }
    }
}

struct MyAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        MyAsyncImage()
    }
}
