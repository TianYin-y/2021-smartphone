//
//  ViewController.swift
//  hero
//
//  Created by admin on 11/20/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

   
    
    
    @IBOutlet weak var tableView: UITableView!
    var heroes = [HeroStats]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadJSON{
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animeateTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        return cell
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroTableViewController {
            destination.hero = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    func downloadJSON(completed: @escaping () -> ()){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
           
            if error == nil {
                do{
                self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
               
                }catch{
                    print("jSON ERROR")
                }
            }
        }.resume()
    }


    func animeateTable (){
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }


}
            
        
  

