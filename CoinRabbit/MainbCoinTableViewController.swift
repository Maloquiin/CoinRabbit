//
//  MainbCoinTableViewController.swift
//  CoinRabbit
//
//  Created by Peri on 07.11.2022.
//

import UIKit
import Alamofire

enum URLApi: String{
    case mainCoin = "https://api.coinstats.app/public/v1/coins?skip=0&limit=25&currency=USD"
    case news = "https://api.coinstats.app/public/v1/news?skip=0&limit=20"
}


class MainbCoinTableViewController: UITableViewController {
    
    var coins = [Coin]()
    
    override func viewWillAppear(_ animated: Bool) {
        getCoins()
    }
    
    override func viewDidLoad() {
        tableView.separatorStyle = .none;
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinCell
        let coin = coins[indexPath.row]
        cell.configure(with: coin)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showcoin", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let pageVC = segue.destination as! ViewController
            pageVC.coin = coins[indexPath.row]
        }
    }
}


extension MainbCoinTableViewController{
    
    
    
    func getCoins() {
        guard let url = URL(string: URLApi.mainCoin.rawValue) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }

            do {
                //let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonCoin = try JSONDecoder().decode(Entry.self, from: data)
                
                self.coins = jsonCoin.coins
                print(self.coins)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    }

