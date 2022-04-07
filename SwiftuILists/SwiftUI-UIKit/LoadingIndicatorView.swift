//
//  UseUIActivityIndicatorView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct LoadingIndicator: UIViewRepresentable {
    
    @Binding var loading: Bool
    
    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = UIColor.gray
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if loading {
            uiView.startAnimating()
        } else {
            uiView.startAnimating()
        }
        
    }
    
}
