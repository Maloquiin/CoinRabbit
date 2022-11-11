//
//  Charts.swift
//  CoinRabbit
//
//  Created by Peri on 08.11.2022.
//

import Foundation

struct Chart: Codable{
    let chart: [[Double]]
}

struct ChartCorrect: Codable{
    let volume: Double
    let price: Double
    let change: Double
    let id: Double
}

