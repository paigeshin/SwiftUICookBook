//
//  ListWithRangeOperator.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

struct ListWithRangeOperator: View {
    var body: some View {
        // List with Range Operator
        List(1...20, id: \.self) { index in
            Text("\(index)")
        }
    }
}

struct ListWithRangeOperator_Previews: PreviewProvider {
    static var previews: some View {
        ListWithRangeOperator()
    }
}
