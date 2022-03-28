//
//  CheckBox.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct CheckBoxList: View {
    
    @State private var selectedFruits = [String]()
    let fruits = ["Apple", "Orange", "Banana", "Cherry", "Coconut", "Kiwi"]
    
    var body: some View {
        VStack {
            List(fruits, id: \.self) { fruit in
                HStack {
                    Text(fruit)
                    Spacer()
                    ZStack {
                        if selectedFruits.contains(fruit) {
                            Image(systemName: "checkmark.square.fill")
                                .font(.largeTitle)
                        } else {
                            Image(systemName: "square")
                                .font(.largeTitle)
                        }
                        
                    }
                    .foregroundColor(.blue)
                    .onTapGesture {
                        if selectedFruits.contains(fruit) {
                            selectedFruits = selectedFruits.filter { $0 != fruit }
                        } else {
                            selectedFruits.append(fruit)
                        }
                    }
                    
                }
            
            } // List
            
            Text("Selected Fruits")
                .font(.title)
            
            List(selectedFruits, id: \.self) { fruit in
                Text(fruit)
            }
            
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxList()
    }
}
