//
//  SelectMultipleItem.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct Customer: Identifiable {
    let id = UUID()
    let name: String
}

struct SelectMultipleItem: View {
    
    @State private var customers = [
        Customer(name: "John"),
        Customer(name: "Alex"),
        Customer(name: "Mary"),
        Customer(name: "Steven"),
        Customer(name: "Geroge"),
        Customer(name: "Jerry"),
    ]
    
    @State private var selectedCustomerIds: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            List(customers, selection: $selectedCustomerIds) { customer in
                HStack {
                    Text(customer.name)
                    Spacer()
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Selected \(selectedCustomerIds.count)")
        }
    }
}

struct SelectMultipleItem_Previews: PreviewProvider {
    static var previews: some View {
        SelectMultipleItem()
    }
}
