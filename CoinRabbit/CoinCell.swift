//
//  CoinCell.swift
//  CoinRabbit
//
//  Created by Peri on 07.11.2022.
//

import UIKit

class CoinCell: UITableViewCell {
    
    @IBOutlet var coinImage: UIImageView!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var changeLabel: UILabel!
    @IBOutlet var symbolLabel: UILabel!
    
    func configure(with coin: Coin) {
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol
        rankLabel.text = "\(coin.rank ?? 0)"
        priceLabel.text = "$\(coin.price ?? 0)"
        
        if coin.priceChange1d ?? 0 > 0 {
            changeLabel.textColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)
        } else{ changeLabel.textColor = .red }
        changeLabel.text = "\(coin.priceChange1d ?? 0)%"
        DispatchQueue.global().async {
            guard let stringUrl = coin.icon,
                  let imageURL = URL(string: stringUrl),
                  let imageData = try? Data(contentsOf: imageURL) else {
                return
            }
            
            DispatchQueue.main.async {
                self.coinImage.image = UIImage(data: imageData)
            }
        }
        
    }
    
}

