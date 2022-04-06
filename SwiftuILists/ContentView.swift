//
//  ContentView.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sheetMode: SheetMode = .none
    
    var body: some View {
        ZStack {
            FlexibleSheet(sheetMode: $sheetMode) {
                VStack {
                    Text("hello world")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                
            }
            
            Button("Show") {
                switch sheetMode {
                case .none:
                    sheetMode = .quarter
                case .quarter:
                    sheetMode = .half
                case .half:
                    sheetMode = .full
                case .full:
                    sheetMode = .none
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

