//
//  BasicPickerView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/07.
//

import SwiftUI

struct BasicPickerView: View {
    
    @State private var selectedGenre: String = ""
    let genres = ["Fiction", "Horror", "Kids", "Romance"]
    
    var body: some View {
        VStack {
            Picker("Select Genre", selection: $selectedGenre) {
                ForEach(genres, id: \.self) { genre in
                    Text(genre)
                }
            }
            .pickerStyle(WheelPickerStyle())
            Text(selectedGenre)
        }
        
    }
}

struct BasicPickerView_Previews: PreviewProvider {
    static var previews: some View {
        BasicPickerView()
    }
}
