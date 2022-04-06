//
//  PassDataView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct PassDataView: View {

    let customers = ["Paige", "Sunghee", "Shin", "Kim"]

    var body: some View {
        NavigationView {
            List(customers, id: \.self) { customer in
                NavigationLink {
                    DetailView(customer: customer)
                } label: {
                    Text(customer)
                }
            }
            .navigationTitle("Customers")
        }
    }
}


fileprivate struct DetailView: View {
    
    let customer: String
    
    var body: some View {
        Text(customer)
    }
    
}

struct PassDataView_Previews: PreviewProvider {
    static var previews: some View {
        PassDataView()
    }
}
