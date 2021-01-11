//
//  PlayWithComputerPlayerNameViewController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2021-01-10.
//

import UIKit

class PlayWithComputerPlayerNameViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var cardView: UIView!
    let segueToPlayWithComputer = "segueToPlayWithComputer"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playButtonClickable(_ sender: UIButton) {
        if let text = playerNameTextField.text, !text.isEmpty
        {
            
            performSegue(withIdentifier: segueToPlayWithComputer, sender: self)
            
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
    func setupUI() {
            playButton.layer.cornerRadius = 10
            cardView.layer.cornerRadius = 10
            cardView.layer.shadowOpacity = 0.4
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowRadius = 10
            cardView.layer.shadowOffset = .zero
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
            if let controller = segue.destination as? PlayWithComputerViewController{
                controller.playerName = playerNameTextField.text
            }
        }
    
}
