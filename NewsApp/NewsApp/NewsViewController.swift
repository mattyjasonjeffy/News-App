//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Matthew Nguyen on 5/23/21.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var news = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-04-23&sortBy=publishedAt&apiKey=ddef7f82601645ae80e6e10c095fcbf5")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
       
                    self.news = dataDictionary["articles"] as! [[String:Any]]
                    self.tableView.reloadData()
             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        let newsarticle = self.news[indexPath.row]
        let title = newsarticle["title"] as! String
        let desc = newsarticle["description"] as! String
        cell.titleLabel!.text = title
        cell.descriptionLabel!.text = desc
        
        return cell
    }
    
}
