//
//  RatingsView.swift
//  UseSwiftUIInUIKit
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct RatingsView: View {
    
    @Binding var rating: Int?
    
    private func startType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.startType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: .constant(3))
    }
}
