//
//  ViewController.swift
//  GetDataFromAPI
//
//  Created by Tian on 2/24/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var lblStockPrice: UILabel!
    var globalStockTxtField : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockAction(_ sender: Any) {
        let alert = UIAlertController(title: "get stock price?", message: "Type in the Symbol", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default) {
            (alertAction) in print("OK")
            guard let stock = self.globalStockTxtField?.text else {return}
            self.getStockValue(stock)
        }
        let cancel = UIAlertAction(title: "Cancle", style: .cancel) {
            (alertAction) in print("Cancle")
        }
        alert.addTextField { (stockTxtField) in
            stockTxtField.placeholder = "Type Stock Symbol"
            self.globalStockTxtField = stockTxtField
        }
        alert.addAction(OK)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func getStockValue(_ stockSymbol : String) {
        let url = getURL(stockSymbol)
        
        print(url)
        AF.request(url).responseJSON { response in
            if response.error == nil {
                let stockData: JSON = JSON(response.data!)
                let json = try! JSON(response.data!)
                for (_, data) in json["articles"] {
                    let title = data["title"].string ?? "N/A"
                    print("title: \(title)")
                }
                print(stockData)
            }else{
                print(response.error?.localizedDescription)
            }
        }
    }
    
    func getURL(_ stockSymbol : String) -> String {
        return apiURL + apiKey
       
    }
    
}

