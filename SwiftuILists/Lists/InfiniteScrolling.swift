//
//  InfiniteScrolling.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct InfiniteScrolling: View {
    
    @StateObject private var numberListVM = NumberListViewModel()
    @State private var currentPage: Int = 1
    
    var body: some View {
        List(numberListVM.numbers, id: \.self) { number in
            Text("\(number)")
                .onAppear {
                    if numberListVM.shouldLoadData(id: number) {
                        currentPage += 1
                        numberListVM.populateData(page: currentPage)
                    }
                }
        }
        .onAppear {
            numberListVM.populateData(page: 1)
        }
    }
}

struct InfiniteScrolling_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteScrolling()
    }
}


fileprivate class NumberListViewModel: ObservableObject {
    
    @Published var numbers: [Int] = []
    
    func populateData(page: Int) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/data?page=\(page)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            let numbers = try? JSONDecoder().decode([Int].self, from: data)
            DispatchQueue.main.async { [weak self] in
                self?.numbers.append(contentsOf: numbers ?? [])
            }
        }.resume()
        
    }
    
    func shouldLoadData(id: Int) -> Bool {
        return id == numbers.count - 2
    }
    
}
