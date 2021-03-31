

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit

class TableViewController: UITableViewController {

    @IBOutlet var tblCommodity: UITableView!
    
    var commodity: [Commodity] = [Commodity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commodity.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CommodityTableViewCell", owner: self, options: nil)?.first as! CommodityTableViewCell
        
        cell.lblName.text = commodity[indexPath.row].state
        cell.lblPrice.text = String(commodity[indexPath.row].total)
        cell.lblPositive.text = String(commodity[indexPath.row].positive)
        
        return cell
    }
  
    func getUrl() -> String{
        let url = apiURL
        
        return url
    }
    
    func getData(){
        let url = getUrl()
        
        getData(url)
            .done{ (commoditys) in
                self.commodity = [Commodity]()
                for commodity in commoditys{
                    self.commodity.append(commodity)
                }
                self.tblCommodity.reloadData()
            }
            .catch{ (error) in
                print("Error in getting all the Commodity Info \(error)")
            }
    }
    
    func getData(_ url : String) -> Promise<[Commodity]>{
        return Promise<[Commodity]> { seal -> Void in
            AF.request(url).responseJSON{ response in
                if response.error == nil{
                    
                    var arr = [Commodity]()
                    guard let data = response.data else{return seal.fulfill( arr )}
                    guard let commoditys = JSON(data).array else{return seal.fulfill( arr )}
                    
                    for commodity in commoditys{
                        let state = commodity["state"].stringValue
                        let total = commodity["totalTestResults"].intValue
                        let positive = commodity["positive"].intValue
                        
                        arr.append(Commodity(state: state, total: total, positive: positive))
                    }
                    seal.fulfill(arr)
                }else{
                    seal.reject(response.error!)
                }
            }
        }
    }
}
