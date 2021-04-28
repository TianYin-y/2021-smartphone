//
//  MainViewController.swift
//  hero
//
//  Created by Tian Yin on 04/16/21.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var tapButton: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapButton(_ sender: Any) {
      print("Dota2")
       let sound = Bundle.main.path(forResource: "dota2", ofType: "mp3")
       do{
           audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
      }catch{
           print("unable to play")
       }
      audioPlayer.play()
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
