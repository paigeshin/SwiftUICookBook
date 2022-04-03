//
//  OnChangeView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct OnChangeView: View {
    
    @State private var isLightOn: Bool = false
    
    var body: some View {
        Toggle("Light", isOn: $isLightOn)
            // The fixedSize() modifier can be used to create a view that maintains the ideal size of its children both dimensions:
            // It can extend parent view's bounds
            .fixedSize()
            .onChange(of: isLightOn) { newValue in
                if newValue {
                    print("Light On")
                } else {
                    print("Light Off")
                }
            }
    }
}

struct OnChangeView_Previews: PreviewProvider {
    static var previews: some View {
        OnChangeView()
    }
}
