//
//  SpecificCornerRadius.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct SpecificCornerRadius: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .frame(width: 300, height: 200)
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}

struct SpecificCornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        SpecificCornerRadius()
    }
}
