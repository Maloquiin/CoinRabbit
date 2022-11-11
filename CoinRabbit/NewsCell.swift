//
//  NewsCell.swift
//  CoinRabbit
//
//  Created by Peri on 08.11.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    //@IBOutlet var newsImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var relatedCoinsLabel: UILabel!
    
    
    func config(with new: News) {
        titleLabel.text = new.title
       // descriptionLabel.text = new.description
        //relatedCoinsLabel.text = new.relatedCoins
        sourceLabel.text = new.source
       
        
//        DispatchQueue.global().async {
//            guard let stringUrl = new.imgURL,
//                  let imageURL = URL(string: stringUrl),
//                  let imageData = try? Data(contentsOf: imageURL) else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self.newsImage.image = UIImage(data: imageData)
//            }
//        }
        
    }
    
}
