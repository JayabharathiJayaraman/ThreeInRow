//
//  twoPlayerGameController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2020-12-28.
//

import UIKit

class TwoPlayerGameViewController: UIViewController {

    @IBOutlet var crossButtons: [UIButton]!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winingPlayerLabel: UILabel!
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winingCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        winingPlayerLabel.font = UIFont(name: "ChalkboardSE-Bold", size: winingPlayerLabel.font.pointSize)
        playAgainButton.layer.cornerRadius = 7
        playAgainButton.titleLabel?.font =  UIFont(name: "Chalkduster", size: 20)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
    }
    @IBAction func crossButtonPressed(_ sender: AnyObject) {
        if(gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
        
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activePlayer = 2
        
            } else{
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
    for combination in winingCombinations
    {
        if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
        {
            gameIsActive = false
            if gameState[combination[0]] == 1
            {
                // Cross has won
            } else {
                // Nought has won
                print("Nought")
            }
            
        }
        
    }
        
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
