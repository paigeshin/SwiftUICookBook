//
//  DrawingView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

fileprivate struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct DrawingView: View {
    
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    
    var body: some View {
        VStack {
            // ios 15
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged ({ value in
                    let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
                })
                .onEnded({ value in
                    self.currentLine = Line(points: [])
                })
        )
        .frame(width: 400, height: 400)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
