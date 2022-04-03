//
//  ImageLoaderView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI


struct ImageLoaderView: View {
    
    var body: some View {
        URLImage(url: "https://img1.daumcdn.net/thumb/R1024x0/?fname=https://t1.daumcdn.net/cafeattach/mEr9/f133e6a4153cd7fb404233f795f6b6e34a80c1ea")
    }
    
}

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @StateObject var imageLoader: ImageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
    }
    
    var body: some View {
        ZStack {
            if let data: Data = self.imageLoader.downloadedData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
            } else {
                Text(placeholder)
            }
        }
        .onAppear {
            imageLoader.downloadImage(url: self.url)
        }
        
    }
    
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView()
    }
}

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
    
        guard let imageURL: URL = URL(string: url) else {
            return 
        }
    
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data: Data = data, error == nil else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.downloadedData = data
            }
        }.resume()
        
    }
    
}
