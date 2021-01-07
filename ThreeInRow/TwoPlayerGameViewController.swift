//
//  twoPlayerGameController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2020-12-28.
//

import UIKit

class TwoPlayerGameViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var crossButtons: [UIButton]!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winingPlayerLabel: UILabel!
    
    @IBOutlet weak var gameDetailsTableView: UITableView!
    let personCellId = "personCellId"
    var player1Name : String?
    var player2Name : String?
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winingCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.blue]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.addSublayer(layer)
        
        
        gameDetailsTableView.dataSource = self
                
                let personCell = UINib(nibName: "GameDetailsTableViewCell", bundle: nil)
                
                gameDetailsTableView.register(personCell, forCellReuseIdentifier: personCellId)
                
        // Do any additional setup after loading the view.
        winingPlayerLabel.font = UIFont(name: "ChalkboardSE-Bold", size: winingPlayerLabel.font.pointSize)
        playAgainButton.layer.cornerRadius = 7
        playAgainButton.titleLabel?.font =  UIFont(name: "Chalkduster", size: 20)
        if let player1Name = player1Name{
        showPlayerTurnToast(message: "\(player1Name) 's turn")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: personCellId, for: indexPath) as! GameDetailsTableViewCell
        
        cell.playerName.text =  player1Name
        cell.player2Name.text = player2Name
       
                return cell
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        if let player2Name = player2Name{
        showPlayerTurnToast(message: "\(player2Name) 's turn")
        }
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        winingPlayerLabel.isHidden = true
        
        for i in 1...9
        {
            if let player1Name = player1Name{
            showPlayerTurnToast(message: "\(player1Name) 's turn")
            }
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    @IBAction func crossButtonPressed(_ sender: AnyObject) {
        
        if(gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
        
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Red.png"), for: UIControl.State())
                if let player2Name = player2Name{
                showPlayerTurnToast(message: "\(player2Name) 's turn")
                }
                activePlayer = 2
        
            } else{
                sender.setImage(UIImage(named: "Yellow.png"), for: UIControl.State())
                if let player1Name = player1Name{
                showPlayerTurnToast(message: "\(player1Name) 's turn")
                }
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
                if let player1Name = player1Name{
                var winningPlayer1Name = "\(player1Name) has Won!"
                winingPlayerLabel.text = winningPlayer1Name
                }
                
                
            } else {
                if let player2Name = player2Name{
                var winningPlayer2Name = "\(player2Name) has Won!"
                winingPlayerLabel.text = winningPlayer2Name
                }
                
            }
            playAgainButton.isHidden = false
            winingPlayerLabel.isHidden = false
            
        }
        
    }
     gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
                
            }
            
        }
        if gameIsActive == false
        {
            winingPlayerLabel.text = "It was a draw!!"
            winingPlayerLabel.isHidden = false
            playAgainButton.isHidden = false
            
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
// Show players turn
    
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
        
        UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }) { (isCompleted) in
            toastLabel.removeFromSuperview()
        
    }
 }
}
