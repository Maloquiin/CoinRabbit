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
    
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard url == response.url else { return }
            
            completion(data, response)
        }
    }
}




