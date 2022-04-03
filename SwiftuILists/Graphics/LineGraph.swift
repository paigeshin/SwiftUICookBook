//
//  LineGraph.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

fileprivate struct Stock {
    let price: Double
}

fileprivate func getYearlyLabels() -> [String] {
    return (2015...2021).map { String($0) }
}

fileprivate func getHistoricalStocks() -> [Stock] {
    var stocks: [Stock] = []
    for _ in 1...20 {
        let stock: Stock = Stock(price: Double.random(in: 100...300))
        stocks.append(stock)
    }
    return stocks
}

struct LineChartView: View {
    
    let values: [Int]
    let labels: [String]
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    private var path: Path {
        
        if values.isEmpty {
            return Path()
        }
        
        var offsetX: Int = Int(screenWidth / CGFloat(values.count))
        var path = Path()
        path.move(to: CGPoint(x: offsetX, y: values[0]))
        
        for value in values {
            offsetX += Int(screenWidth / CGFloat(values.count))
            path.addLine(to: CGPoint(x: offsetX, y: value))
        }
        
        return path
    }
    
    var body: some View {
        VStack {
            path.stroke(Color.white, lineWidth: 2.0)
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            HStack {
                ForEach(labels, id: \.self) { label in
                    Text(label)
                        .frame(width: screenWidth/CGFloat(labels.count) - 10 )
                }
            }
        }
    }
}

struct LineGraph: View {
    
    fileprivate let prices: [Int] = getHistoricalStocks().map { Int($0.price) }
    fileprivate let labels: [String] = getYearlyLabels()
    
    var body: some View {
        VStack {
            LineChartView(values: prices, labels: labels)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .foregroundColor(.white)
    }
    
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        LineGraph()
    }
}
