//
//  TagViews.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct TagViews: View {

    let words = [
        "Apple", "Blueberries", "Banana", "Orange", "Dragon fruit", "Mango", "Avocado", "Lychee", "Pineapple", "Strawberries", "Durian", "Cherries", "Olives", "Watermelon", "Kiwi", "Peaches", "Guava", "Grapes", "Pomegranates", "Grapefruit", "Banana"
    ]

    var body: some View {
        TagView(items: words)
    }
}

struct TagViews_Previews: PreviewProvider {
    static var previews: some View {
        TagViews()
    }
}

struct TagView: View {
    
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    
    init(items: [String]) {
        self.items = items
        self.groupedItems = createGroupedItems(items)
    }
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(groupedItems, id: \.self) { subItems in
                    HStack {
                        ForEach(subItems, id: \.self) { word in
                            Text(word)
                                .fixedSize()
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        }
                    }
                }
            }
        }
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] = [String]()
        var width: CGFloat = 0

        for word in items {
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            // CALCULATE LABEL WIDTH
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 32) < UIScreen.main.bounds.width {
                width += labelWidth
                tempItems.append(word) // Save it to temp items
            } else {
                // when there is not enough space, reinitialize with
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll() // clear temp
                tempItems.append(word)
            }
            
        }
        
        groupedItems.append(tempItems)
        
        return groupedItems
    }
    
}
