//
//  NewsTableViewController.swift
//  GetDataFromAPI
//
//  Created by Tian on 2/25/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class NewsTableViewController: UITableViewController {

    var newsArr: [String] = [String]()
    
    @IBOutlet var tblNews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = newsArr[indexPath.row]
        
        return cell
    }
    
    func getURL() -> String {
        return apiURL + apiKey
       
    }
    
    func getData() {
        let url = getURL()
        
        print(url)
        AF.request(url).responseJSON { response in
            if response.error == nil {
                let stockData: JSON = JSON(response.data!)
                let json = try! JSON(response.data!)
                
                self.newsArr = [String]()
                for (_, data) in json["articles"] {
                    let title = data["title"].string ?? "N/A"
                    self.newsArr.append(title);
                }
                print(self.newsArr)
            }else{
                print(response.error?.localizedDescription)
            }
            self.tblNews.reloadData()
            
        }
    }

}
