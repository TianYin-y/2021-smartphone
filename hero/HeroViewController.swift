//
//  HeroViewController.swift
//  hero
//
//  Created by admin on 11/20/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit



class HeroViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var attributeLbl: UILabel!
    
    @IBOutlet weak var attackLbl: UILabel!
    
    @IBOutlet weak var legsLbl: UILabel!
    
    
    @IBOutlet weak var attackNum: UILabel!
   
    
    @IBOutlet weak var hpLbl: UILabel!
    
    @IBOutlet weak var mpLbl: UILabel!
    
    @IBOutlet weak var dexLbl: UILabel!
    
    @IBOutlet weak var strLbl: UILabel!
    
    
    @IBOutlet weak var intLbl: UILabel!
    
    
    @IBOutlet weak var moveLbl: UILabel!
    
    @IBOutlet weak var propickLbl: UILabel!
    
    @IBOutlet weak var prowinLbl: UILabel!
    
    
    var hero : HeroStats!
    
    var nameHero = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = hero.localized_name
        attributeLbl.text = hero.primary_attr 
        attackLbl.text = hero.attack_type
        
        
        attackNum.text = "\((hero.base_attack_max))"
        hpLbl.text = "\((hero.base_health))"
        mpLbl.text = "\((hero.base_mana))"
        dexLbl.text = "\((hero.base_agi))"
        strLbl.text = "\((hero.base_str))"
        intLbl.text = "\((hero.base_int))"
        moveLbl.text = "\((hero.move_speed))"
        propickLbl.text = "\((hero.pro_pick))"
        prowinLbl.text = "\((hero.pro_win))"
        
        let urlString = "https://api.opendota.com"+(hero.img)
        let url = URL(string: urlString)
        
        imageView.downloaded(from: url!)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fav(_ sender: Any) {
        self.nameHero = nameLbl.text!
        performSegue(withIdentifier: "favHero", sender: self)
        //add hero to the array
        favHeroViewController.heroes.append(hero)
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! favHeroViewController; vc.finalName = self.nameHero
        print(nameHero)
    }
    
}

