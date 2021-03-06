//
//  BoardViewController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2020-12-23.
//

import UIKit

class TwoPlayerNameViewController: UIViewController {

    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    
    @IBOutlet weak var enterPlayer1Name: UITextField!
    @IBOutlet weak var enterPlayer2Name: UITextField!
    @IBOutlet weak var startNewGameButton: UIButton!
    
    let segueToGame = "segueToGame"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        player1Name.font = UIFont(name: "Chalkduster", size: player1Name.font.pointSize)
        player2Name.font = UIFont(name: "Chalkduster", size: player1Name.font.pointSize)
        
        // Do any additional setup after loading the view.
        startNewGameButton.titleLabel?.font =  UIFont(name: "Chalkduster", size: 20)
    }

    @IBAction func startNewGame(_ sender: Any) {
        if let text = enterPlayer1Name.text, !text.isEmpty
        {
            if let text = enterPlayer2Name.text, !text.isEmpty
            {
                performSegue(withIdentifier: segueToGame, sender: self)
            }
        }
        showPlayerTurnToast(message: "Enter player name")
    }
    func showPlayerTurnToast(message: String)
    {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2-75, y: self.view.frame.height - 100, width: 150, height: 40))
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }) { (isCompleted) in
            toastLabel.removeFromSuperview()
        
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
    
    //pass player names to another view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TwoPlayerGameViewController{
            controller.player1Name = enterPlayer1Name.text
            controller.player2Name = enterPlayer2Name.text
            
        }
    }
}
