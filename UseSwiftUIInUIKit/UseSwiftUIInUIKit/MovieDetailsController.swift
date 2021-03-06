//
//  MovieDetailsController.swift
//  UseSwiftUIInUIKit
//
//  Created by paige on 2022/04/08.
//

import UIKit
import SwiftUI

struct MovieDetails: UIViewControllerRepresentable {
    
    let name: String
    typealias UIViewControllerType = MovieDetailsController
    
    func makeUIViewController(context: Context) -> MovieDetailsController {
        return MovieDetailsController()
    }
    
    func updateUIViewController(_ uiViewController: MovieDetailsController, context: Context) {
        uiViewController.setMovieName(name)
    }
    
}

class MovieDetailsController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.text = "Label"
        label.font = UIFont(name: "Arial", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    func setMovieName(_ name: String) {
        titleLabel.text = name
    }

}
