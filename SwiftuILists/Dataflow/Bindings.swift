//
//  Bindings.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/31.
//

import SwiftUI

struct Bindings: View {
    
    @State private var name: String = ""
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text(name)
                .font(.largeTitle)
            
            Button("Add Item") {
                name = ""
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented) {
            AddItemView(name: $name)
        }
    }
}

struct Bindings_Previews: PreviewProvider {
    static var previews: some View {
        Bindings()
    }
}

fileprivate struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var name: String
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Enter name", text: $name)
                HStack {
                    Spacer()
                    Button("Submit") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Add Item")
        }
        
    }
    
}
