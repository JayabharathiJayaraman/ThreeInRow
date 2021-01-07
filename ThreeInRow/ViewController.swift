//
//  ViewController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2020-12-22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var threeInRow: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var twoPlayersButton: UIButton!
    let segueToPlayerName = "segueToPlayerName"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //playButton.layer.cornerRadius = 5
        //playButton.layer.masksToBounds = true
        customizePlayButton(buttonName: playButton)
        customizeTwoPlayerButton(buttonName: twoPlayersButton)
        threeInRow.font = UIFont(name: "ChalkboardSE-Bold", size: threeInRow.font.pointSize)
        
        playButton.titleLabel?.font =  UIFont(name: "Chalkduster", size: 20)
        twoPlayersButton.titleLabel?.font =  UIFont(name: "Chalkduster", size: 20)

    }
    

    @IBAction func twoPlayersButton(_ sender: UIButton) {
        performSegue(withIdentifier: segueToPlayerName, sender: self)
    }
   
    func customizePlayButton(buttonName:UIButton) {
            // change UIbutton propertie
            let c1GreenColor = (UIColor(red: -0.108958, green: 0.714926, blue: 0.758113, alpha: 1.0))
            let c2GreenColor = (UIColor(red: 0.108958, green: 0.714926, blue: 0.758113, alpha: 1.0))
        buttonName.backgroundColor = UIColor.systemTeal
            buttonName.layer.cornerRadius = 7
            buttonName.layer.borderWidth = 0.8
            buttonName.layer.borderColor = c1GreenColor.cgColor
            
            buttonName.layer.shadowColor = c2GreenColor.cgColor
            buttonName.layer.shadowOpacity = 0.8
            buttonName.layer.shadowRadius = 12
            buttonName.layer.shadowOffset = CGSize(width: 1, height: 1)
            
            buttonName.setImage(UIImage(named:"play.png"), for: .normal)
            buttonName.imageEdgeInsets = UIEdgeInsets(top: 6,left: 100,bottom: 6,right: 14)
            buttonName.titleEdgeInsets = UIEdgeInsets(top: 0,left: -5,bottom: 0,right: 34)
        
        }
    func customizeTwoPlayerButton(buttonName:UIButton) {
            // change UIbutton propertie
            let c1GreenColor = (UIColor(red: -0.108958, green: 0.714926, blue: 0.758113, alpha: 1.0))
            let c2GreenColor = (UIColor(red: 0.108958, green: 0.714926, blue: 0.758113, alpha: 1.0))
        buttonName.backgroundColor = UIColor.systemTeal
            buttonName.layer.cornerRadius = 7
            buttonName.layer.borderWidth = 0.8
            buttonName.layer.borderColor = c1GreenColor.cgColor
            
            buttonName.layer.shadowColor = c2GreenColor.cgColor
            buttonName.layer.shadowOpacity = 0.8
            buttonName.layer.shadowRadius = 12
            buttonName.layer.shadowOffset = CGSize(width: 1, height: 1)
            
            
        }
    
}

