//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Tian Yin on 3/17/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var DateText: UILabel!
    

    
    @IBOutlet weak var HighTempText: UILabel!
    
    @IBOutlet weak var LowTempText: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
