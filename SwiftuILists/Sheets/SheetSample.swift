//
//  AddItemView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/04.
//

import SwiftUI

struct SheetSample: View {
    
    @State var showSheet = false
    
    var body: some View {
        VStack {
            Button {
                showSheet = true
            } label: {
                Text("Add Item")
            }
        }
        .sheet(isPresented: $showSheet) {
            AddItemView()
        }
    }
    
}

fileprivate struct AddItemView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("AddItem View")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            navigationTitle("Add Item")
        }
        
    }
}

struct SheetSample_Previews: PreviewProvider {
    static var previews: some View {
        SheetSample()
    }
}
