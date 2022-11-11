//
//  News.swift
//  CoinRabbit
//
//  Created by Peri on 08.11.2022.
//
import Foundation

struct Entry2: Codable{
    let news : [News]
}

struct News: Codable{
    let id: String?
    let feedDate: Int?
    let source: String?
    let title: String?
    let isFeatured: Bool?
    let description: String?
    let imgURL: String?
    let link: String?
    let sourceLink: String?
    let reactionsCount: Related
    let shareURL: String?
    let relatedCoins: [String?]
}

struct Related: Codable{
    let c1: Int?
    let c2: Int?
    let c3: Int?
}
