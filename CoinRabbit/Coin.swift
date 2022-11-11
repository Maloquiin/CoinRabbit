//
//  Coin.swift
//  CoinRabbit
//
//  Created by Peri on 07.11.2022.
//

import Foundation

struct Entry: Codable {
    let coins: [Coin]
}

//struct DecodableType: Decodable { let url: String }


struct Coin: Codable{
    let id: String?
    let icon: String?
    let name: String?
    let symbol: String?
    let rank: Int?
    let price: Float?
    let priceBtc: Float?
    let volume: Float?
    let marketCap: Float?
    let availableSupply: Float?
    let totalSupply: Float?
    let priceChange1h: Float?
    let priceChange1d: Float?
    let priceChange1w: Float?
    let contractAddress: String?
    let decimals: Float?
    let websiteUrl: String?
    let redditUrl: String?
    let twitterUrl: String?
    let exp: [String]?
    
//    init(coinData: [String: Any]) {
//        id = coinData["id"] as? String
//        icon = coinData["icon"] as? String
//        name = coinData["name"] as? String
//        symbol = coinData["symbol"] as? String
//        rank = coinData["rank"] as? String
//        price = coinData["id"] as? String
//        priceBtc = coinData["priceBtc"] as? String
//        volume = coinData["volume"] as? String
//        marketCap = coinData["marketCap"] as? String
//        availableSupply = coinData["availableSupply"] as? String
//        totalSupply = coinData["totalSupply"] as? String
//        priceChange1h = coinData["priceChange1h"] as? String
//        priceChange1d = coinData["priceChange1d"] as? String
//        priceChange1w = coinData["priceChange1w"] as? String
//        websiteUrl = coinData["websiteUrl"] as? String
//        redditUrl = coinData["redditUrl"] as? String
//        twitterUrl = coinData["twitterUrl"] as? String
//        exp = coinData["exp"] as? [String]
//        contractAddress = coinData["contractAddress"] as? String
//        decimals = coinData["decimals"] as? String
        
    }
    
//    static func getCoin(from value: Any) -> [Coin] {
//        guard let coinData = value as? [[String: Any]] else { return [] }
//        return coinData.compactMap { Coin(coinData: $0) }
//    }
//}


