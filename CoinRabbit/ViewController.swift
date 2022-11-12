//
//  ViewController.swift
//  CoinRabbit
//
//  Created by Peri on 07.11.2022.
//
import Charts
import UIKit

class ViewController: UIViewController, ChartViewDelegate {
    
   // var lineChart = LineChartView()
    
    var coin:Coin!
    
    var chart:Chart!
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceBtcLabel: UILabel!
    @IBOutlet var VolumeLabel: UILabel!
    
    @IBOutlet var change1dLabel: UILabel!
    @IBOutlet var coinImage: CachImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        getCharts()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePage()
       // lineChart.delegate = self
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        lineChart.frame = CGRect(x: 0, y: 300,
//                                 width: self.view.frame.size.width,
//                                 height: self.view.frame.size.width)
//
//        //lineChart.center = view.center
//        view.addSubview(lineChart)
//
//
//
//
//        var entries = [ChartDataEntry]()
//        dump(chart)
//        for _ in 0...30 {
//            entries.append(ChartDataEntry(x: Double(1),
//                                          y: Double(2)))
//        }
//        let set = LineChartDataSet(entries: entries)
//        set.colors = ChartColorTemplates.material()
//
//        let data = LineChartData(dataSet: set)
//
//        lineChart.data = data
//
//    }
    
}

extension ViewController{
    func generatePage(){
        title = "\(coin.symbol ?? "") #\(coin.rank ?? 0)"
        nameLabel.text = coin.name
        
        if coin.price! < 0.05 {
            priceLabel.text = String(format: "%.8f ", coin.price!) + "USD"
    } else {
        priceLabel.text = "\(coin.price ?? 0) USD"
    }
        
        if coin.volume! > 1000000000 {
           let bVolume = coin.volume!/1000000000
            VolumeLabel.text = String(format: "Объем: %.2f ", bVolume) + "Bn"
        } else {
            let bVolume = coin.volume!/1000000
            VolumeLabel.text = String(format: "Объем: %.2f ", bVolume) + "Mn"
        }
        
        
        if coin.priceBtc! < 1 {
            priceBtcLabel.text = String(format: "Цена в BTC: %.6f ", coin.priceBtc!)
        } else {
            priceBtcLabel.text = String(format: "Цена в BTC: %.1f ", coin.priceBtc!)
        }
        
       // priceBtcLabel.text = "Цена в BTC: \(coin.priceBtc ?? 0)"
        
        if coin.priceChange1d ?? 0 > 0 {
            change1dLabel.backgroundColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)
        } else{ change1dLabel.backgroundColor = .red }
        change1dLabel.text = "\(coin.priceChange1d ?? 0)%"
        change1dLabel.layer.masksToBounds = true
        change1dLabel.layer.cornerRadius = 5
        change1dLabel.textColor = .white
        coinImage.fetchImage(from: coin.icon ?? "")
        
//        DispatchQueue.global().async {
//            guard let stringUrl = self.coin.icon,
//                  let imageURL = URL(string: stringUrl),
//                  let imageData = try? Data(contentsOf: imageURL) else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self.ImageBarItem.image = UIImage(data: imageData)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//            }
//        }
    }
    
    func getCharts() {
        guard let url = URL(string: "https://api.coinstats.app/public/v1/charts?period=1m&coinId=\(coin.id ?? "")") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }

            do {
                //let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonShart = try JSONDecoder().decode(Chart.self, from: data)
            
                self.chart = jsonShart
                print(self.chart!)
                DispatchQueue.main.async {
                    self.viewDidLoad()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

