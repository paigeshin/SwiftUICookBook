//
//  GlobalState.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/31.
//

import SwiftUI

fileprivate struct GlobalStateInitialView: View {
    
    var body: some View {
        let counter: Counter = Counter()
        MyView()
            .environmentObject(counter)
    }
    
}

fileprivate struct MyView: View {
    
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        ZStack {
            
            Button {
                counter.increment()
            } label: {
                Text("\(counter.value)")
                    .font(.largeTitle)
            }

        }
    }
}

struct MyView_Previews: PreviewProvider {
    
    static var previews: some View {
        GlobalStateInitialView()
    }
}

fileprivate class Counter: ObservableObject {
    
    @Published var value: Int = 0
    
    func increment() {
        DispatchQueue.main.async { [weak self] in
            self?.value += 1
        }
    }
    
}
