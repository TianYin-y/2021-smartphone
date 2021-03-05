//
//  CommodityTableViewController.swift
//  NetworkCallsWithPromises


import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit

class CommodityTableViewController: UITableViewController {

    var commodityArray: [Commodity] = [Commodity]()
    
    @IBOutlet var tblCommodity: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commodityArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CommodityTableViewCell", owner: self, options: nil)?.first as! CommodityTableViewCell
        
        cell.lblName.text = "\(commodityArray[indexPath.row].name)"
        cell.lblPrice.text = "$ \(commodityArray[indexPath.row].price)"
        
        return cell
    }
    
    func getURL() -> String {
        return apiURL + apiKey
    }
    
    func getData() {
        let url = getURL()
        print(url)
        getQuickShortQuote(url).done { (commodities) in
            if commodities.count == 0 {
                return
            }
            self.commodityArray = [Commodity]()
            for commodity in commodities {
                self.commodityArray.append(commodity)
            }
            self.tblCommodity.reloadData()
        }.catch { (error) in
            print("Error in getting all the Commodity values \(error)")
        }
    }
    
    func getQuickShortQuote(_ url : String) -> Promise<[Commodity]> {
        return Promise<[Commodity]> {seal -> Void in
            
            AF.request(url).responseJSON { response in
                if response.error == nil {
                    var arr = [Commodity]()
                    guard let data = response.data else {return seal.fulfill(arr)}
                    
                    guard let commodities = JSON(data).array else {return seal.fulfill(arr)}
                   
                    for commodity in commodities {
                        // name
                        let name = commodity["name"].stringValue
                        // price
                        let price = commodity["price"].floatValue
                        
                        arr.append(Commodity(name: name, price: price))
                    }
                    seal.fulfill(arr)
                    
                }else{
                    seal.reject(response.error!)
                }
            }
        }
    }

}
