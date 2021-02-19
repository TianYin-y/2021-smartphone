//
//  TableViewController.swift
//  TableViewXib
//
//  Created by tian yin on 2/18/21.
//

import UIKit

class TableViewController: UITableViewController {
    

    let cities = ["Seattle", "Portand", "SFO", "LA", "Diego", "NY", "Miami"]
    let temperatures = ["43", "38", "62", "69", "66", "29", "79"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.LblCity.text = cities[indexPath.row]
        cell.LblTemp.text = temperatures[indexPath.row] + " F°"
        
        return cell
    }
    

    
}
