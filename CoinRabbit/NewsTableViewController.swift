//
//  NewsTableViewController.swift
//  CoinRabbit
//
//  Created by Peri on 08.11.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var news = [News]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        getNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 100
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellnews", for: indexPath) as! NewsCell
        let new = news[indexPath.row]
        cell.config(with: new)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = news[indexPath.row]
        if let url = URL(string: new.link ?? "") {
            UIApplication.shared.open(url)
        }
     //   performSegue(withIdentifier: "showcoin", sender: nil)
    }
}

extension NewsTableViewController{
    
    func getNews() {
        guard let url = URL(string: URLApi.news.rawValue) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }

            do {
                //let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonNews = try JSONDecoder().decode(Entry2.self, from: data)
                
                self.news = jsonNews.news
                print(self.news)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }

}
