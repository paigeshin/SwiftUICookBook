//
//  BackgroundList.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct BackgroundList: View {
    
    init() {
        // Entire List Background
        UITableView.appearance().backgroundColor = .brown
    }
    
    var body: some View {
        
        List(1...20, id: \.self) { index in
            Text("\(index)")
                .listRowBackground(Color.red)
        }
        
    }
}

struct BackgroundList_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundList()
    }
}


