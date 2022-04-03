//
//  PushInViews.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/30.
//

import SwiftUI

struct PushOutViews: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.red)
            Rectangle()
                .foregroundColor(.blue)
        }
    }
}

struct PushOutViews_Previews: PreviewProvider {
    static var previews: some View {
        PushOutViews()
    }
}
