//
//  BoardViewController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2020-12-23.
//

import UIKit

class TwoPlayerNameViewController: UIViewController {

    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    
    @IBOutlet weak var startNewGameButton: UIButton!
    
    let segueToGame = "segueToGame"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        player1Name.font = UIFont(name: "Chalkduster", size: player1Name.font!.pointSize)
        player2Name.font = UIFont(name: "Chalkduster", size: player2Name.font!.pointSize)
        // Do any additional setup after loading the view.
        startNewGameButton.titleLabel?.font =  UIFont(name: "Chalkduster", size: 20)
    }

    @IBAction func startNewGame(_ sender: Any) {
        performSegue(withIdentifier: segueToGame, sender: self)
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
