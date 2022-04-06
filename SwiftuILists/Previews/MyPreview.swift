//
//  MyPreview.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct MyPreview: View {
    
    let dish: Dish
    @State private var rating: Int?
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Image("cat")
                    .resizable()
                
                Text("French Toast")
                    .font(.title)
                
                Text("This classic French Toast recipe is easy, uses simple pantry ingredients, and has a secret ingredient that makes a thicker better with cinnamon sugar flavors that really set it apart. It's one of our family's favorite breakfasts!")
                
                RatingView(rating: $rating)
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Today's Special")
            
        }
    }
}

struct MyPreview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            // Devices
            MyPreview(dish: SampleProvider.getDishSample())
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            // Devices
            MyPreview(dish: SampleProvider.getDishSample())
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")
            
            // Size That Fits
            RatingView(rating: .constant(3))
                .previewLayout(.sizeThatFits)
            
            // Dynamic Fonts
            MyPreview(dish: SampleProvider.getDishSample())
                .environment(\.sizeCategory, .large)
            
            // Dynamic fonts
//            ForEach(ContentSizeCategory.allCases, id: \.self) { item in
//                MyPreview(dish: SampleProvider.getDishSample())
//                    .environment(\.sizeCategory, item)
//                    .previewDisplayName("\(item)")
//            }
            
            // Light Mode & Dark Mode
//            Group {
//                MyPreview(dish: SampleProvider.getDishSample())
//                    .preferredColorScheme(.light)
//                MyPreview(dish: SampleProvider.getDishSample())
//                    .preferredColorScheme(.dark)
//            }
//
            // Populate Xcode previews using JSON Resource
            
            
        }
    }
}

struct Dish: Decodable {
    let photo: String
    let title: String
    let content: String
}

struct SampleProvider {
    
    static func getDishSample() -> Dish {
        guard let url = Bundle.main.url(forResource: "sample-dish", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
                  fatalError("the resource sample-dish.json was not found!")
              }
        let dish = try? JSONDecoder().decode(Dish.self, from: data)
        return dish!
    }
    
}
