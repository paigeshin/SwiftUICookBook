//
//  HeroAnimation.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct HeroAnimation: View {
    
    // What is Namespace
    @Namespace var namespace
    
    @State private var selectedSymbol: String?
    
    let symbols = [
        "keyboard",
        "hifispeaker.fill",
        "printer.fill",
        "tv.fill",
        "desktopcomputer",
        "headphones",
        "tv.music.note",
        "mic",
        "plus.bubble",
        "video"
    ]
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        VStack {
            
            if selectedSymbol == nil {
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols, id: \.self) { symbol in
                        Image(systemName: symbol)
                            .font(.system(size: 40))
                            .padding()
                            .matchedGeometryEffect(id: symbol, in: namespace)
                            .onTapGesture {
                                withAnimation {
                                    selectedSymbol = symbol
                                }
                            }
                    }
                }
            } else if let selectedSymbol = selectedSymbol {
                Image(systemName: selectedSymbol)
                    .matchedGeometryEffect(id: selectedSymbol, in: namespace)
                    .font(.system(size: 70))
                    .onTapGesture {
                        withAnimation {
                            self.selectedSymbol = nil
                        }
                    }
                Spacer()
            }
            
        }
    }
}

struct HeroAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HeroAnimation()
    }
}
