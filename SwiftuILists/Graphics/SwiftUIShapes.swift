//
//  CreateShapeView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct SwiftUIShapes: View {
    var body: some View {
        
        VStack {
            
            Rectangle()
                .fill(Color.brown)
                .frame(width: 400, height: 400)
                
            
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25.5, style: .continuous)
                .fill(Color.blue)
                .frame(width: .infinity, height: 100)

            Capsule()
                .fill(Color.green)
                .frame(width: 100, height: 50)

            Ellipse()
                .fill(Color.purple)
                .frame(width: 100, height: 50)

            Path { p in
                p.move(to: CGPoint(x: 100, y: 100))
                p.addLine(to: CGPoint(x: 100, y: 300))
                p.addLine(to: CGPoint(x: 300, y: 300))
                p.addLine(to: CGPoint(x: 100, y: 100))
            }
            .stroke()
            
        }
        .padding()
        
    }
}

struct CreateShapeView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShapes()
    }
}
