//
//  MultipleSheet.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/04.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addItem
    case showItem
}

struct MultipleSheet: View {
    
    @State private var activeSheet: ActiveSheet?
    
    var body: some View {
        HStack {
            Button("Add Item") {
                activeSheet = .addItem
            }
            Button("Show Item") {
                activeSheet = .showItem
            }
        }
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .addItem:
                Text("Add Item")
            case .showItem:
                Text("Show Item")
            }
        }
    }
}

struct MultipleSheet_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheet()
    }
}
