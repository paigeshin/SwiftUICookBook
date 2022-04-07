//
//  PullToRefreshExampleView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct PullToRefreshExampleView: View {
    
    @StateObject var viewModel = CustomerListViewModel()
    
    var body: some View {
        List(viewModel.customers, id: \.self) { customer in
            Text(customer)
        }
        .onAppear {
            viewModel.fetch()
        }
        .refreshable {
            viewModel.fetch()
        }
    }
}

struct PullToRefreshExampleView_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshExampleView()
    }
}


class CustomerListViewModel: ObservableObject {
    
    @Published var customers: [String] = []
    
    func fetch() {
        
        let letters = "abcdefghi"
        var names = [String]()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            for _ in 1...20 {
                let randomName = String((0...letters.count).map { _ in letters.randomElement()! })
                names.append(randomName)
            }
            self.customers = names
        }
        
    }
    
}
