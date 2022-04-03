//
//  BarChartView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

fileprivate struct Stock {
    let price: Double
}

fileprivate func getYearlyLabels() -> [String] {
    return (2000...2021).map { String($0) }
}

fileprivate func getHistoricalStocks() -> [Stock] {
    var stocks: [Stock] = []
    for _ in 1...20 {
        let stock: Stock = Stock(price: Double.random(in: 100...300))
        stocks.append(stock)
    }
    return stocks
}

struct BarChartView: View {
    
    let values: [Int]
    let labels: [String]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                ForEach(values.indices) { index in
                    let label: String = labels[index]
                    let value: Int = values[index]
                    VStack {
                        Text("\(value)")
                        Rectangle()
                            .fill(value <= 120 ? Color.red : Color.blue)
                            .frame(width: 44, height: CGFloat(value))
                        Text(label)
                    }
                    .padding([.leading, .trailing], 8)
                }
            }
        }
        
    }
    
}

struct BarChart: View {
    
    fileprivate let prices: [Int] = getHistoricalStocks().map { Int($0.price) }
    fileprivate let labels: [String] = getYearlyLabels()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                BarChartView(values: prices, labels: labels)
            }
            .navigationTitle("Stocks")
        }
    }
    
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
