//
//  MySampleView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct MySampleView: View {
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Image("cat")
                    .resizable()
                
                Text("Siberian Cat")
                    .font(.title)
                
                Text("Cat is cute! Cat is sexy! Cat rules the world!")
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Today's Special")
            
        }
    }
}

struct MySampleView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
            .previewLayout(.sizeThatFits)
    }
}
