//
//  RatingView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct RatingView: View {

    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating: Int = rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

struct DisplayRatingView: View {

    @State private var rating: Int?
    
    var body: some View {
        VStack {
            RatingView(rating: $rating)
        }
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayRatingView()
    }
}
