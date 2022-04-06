//
//  ViewController.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        let imageView: UIImageView = UIImageView(image: UIImage(named: "cat"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        
    }
    
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ViewController
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
}

struct ViewControllerPreview: PreviewProvider {
    
    static var previews: some View {
        ViewControllerRepresentable()
    }
    
}
