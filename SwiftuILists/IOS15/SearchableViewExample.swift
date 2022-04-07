//
//  SearchableViewExample.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct MyCustomerListView: View {
    
    let customers: [String]
    
    var body: some View {
        List(customers, id: \.self) { customer in
            Text(customer)
        }
    }
}

struct SearchableViewExample_Previews: PreviewProvider {
    static var previews: some View {
        LesarnSearchable()
    }
}

struct LesarnSearchable: View {
    
    let names = ["Laex", "John", "Jack", "Mary", "Jerry", "Azam", "Steve"]
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            MyCustomerListView(customers: names)
        }
        .searchable(text: $text) {
            ForEach(names.filter { $0.hasPrefix(text) }, id: \.self) { name in
                Text(name)
            }
        }
        .onSubmit(of: .search) {
            // When search is performed 
        }
    }
    
}
