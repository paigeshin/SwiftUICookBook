//
//  DifferentModalSize.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/04.
//

import SwiftUI

/// Display quater, half and full screen sheet
 
enum SheetMode {
    case none
    case quarter
    case half
    case full
}

struct FlexibleSheet<Content: View>: View {
    
    let content: () -> Content
    var sheetMode: Binding<SheetMode>
    
    init(sheetMode: Binding<SheetMode>, @ViewBuilder content: @escaping() -> Content) {
        self.content = content
        self.sheetMode = sheetMode
    }
    
    private func calculateOffset() -> CGFloat {
        switch sheetMode.wrappedValue {
        case .none:
            return UIScreen.main.bounds.height
        case .quarter:
            return UIScreen.main.bounds.height - 200
        case .half:
            return UIScreen.main.bounds.height / 2
        case .full:
            return 0
        }
    }
    
    var body: some View {
        content()
            .offset(y: calculateOffset())
            .animation(.spring())
            .ignoresSafeArea()
    }
}

struct FlexibleSheet_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleSheet(sheetMode: .constant(.none)) {
            VStack {
                Text("Hello World")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        }
    }
}


struct UsageView: View {
    
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
