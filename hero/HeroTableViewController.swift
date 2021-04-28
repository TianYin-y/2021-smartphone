//
//  HeroTableViewController.swift
//  hero
//
//  Created by admin on 12/15/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}



class HeroTableViewController: UITableViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var attackLbl: UILabel!
    
    @IBOutlet weak var attributeLbl: UILabel!
    
    @IBOutlet weak var dexLbl: UILabel!
    
    @IBOutlet weak var strLbl: UILabel!
    
    @IBOutlet weak var intLbl: UILabel!
    
    @IBOutlet weak var attackNum: UILabel!
    
    @IBOutlet weak var pro_Picks: UILabel!
    
    @IBOutlet weak var pro_Wins: UILabel!
    
    
    @IBOutlet weak var movementSpeed: UILabel!
    var hero : HeroStats!
    
    var nameHero = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = hero.localized_name
        
        
        let urlString = "https://api.opendota.com"+(hero.img)
        let url = URL(string: urlString)
        
        imageView.downloaded(from: url!)
        
      
        nameLbl.text = hero.localized_name
        attributeLbl.text = hero.primary_attr
        attackLbl.text = hero.attack_type
        dexLbl.text = "\((hero.base_agi))"
        strLbl.text = "\((hero.base_str))"
        intLbl.text = "\((hero.base_int))"
        attackNum.text = "\((hero.base_attack_max))"
        movementSpeed.text = "\((hero.move_speed))"
        pro_Picks.text = "\((hero.pro_pick))"
        pro_Wins.text = "\((hero.pro_win))"
       
        
        
        
        
        print(hero)

    
    }

   
    

}
