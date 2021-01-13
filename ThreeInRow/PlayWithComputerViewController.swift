//
//  PlayWithComputerViewController.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2021-01-10.
//

import UIKit

class PlayWithComputerViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winingPlayerLabel: UILabel!
    var lastValue = "o"
    let playerCellId = "playerCellId"
    var playerName : String?
    var playerChoices: [Image] = []
    var computerChoices: [Image] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
                
        let playerDetailsCell = UINib(nibName: "GameDetailsAgainstComputerTableViewCell", bundle: nil)
                
        tableView.register(playerDetailsCell, forCellReuseIdentifier: playerCellId)
        // Do any additional setup after loading the view.
        createTap(on: image1, type: .one)
        createTap(on: image2, type: .two)
        createTap(on: image3, type: .three)
        createTap(on: image4, type: .four)
        createTap(on: image5, type: .five)
        createTap(on: image6, type: .six)
        createTap(on: image7, type: .seven)
        createTap(on: image8, type: .eight)
        createTap(on: image9, type: .nine)
        
        playerNameLabel.text = playerName
        
        if let playerName = playerName{
        showPlayerTurnToast(message: "\(playerName)'s turn")
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        resetGame()
        playAgainButton.isHidden = true
        winingPlayerLabel.isHidden = true
        imagesClickable()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: playerCellId, for: indexPath) as! GameDetailsAgainstComputerTableViewCell
        cell.playerName.text = playerName
        return cell
    }
    
    
    func createTap(on imageView: UIImageView, type box: Image) {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageClicked(_:)))
            tap.name = box.rawValue
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tap)
        }
    
    @objc func imageClicked(_ sender: UITapGestureRecognizer){
        let selectedImage = getImage(from: sender.name ?? "")
        makeChoice(selectedImage)
         playerChoices.append(Image(rawValue: sender.name!)!)
                checkIfWon()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.computerPlay()
        }
        }
    func computerPlay() {
            var availableSpaces = [UIImageView]()
            var availableImages = [Image]()
            for name in Image.allCases {
                let image = getImage(from: name.rawValue)
                if image.image == nil {
                    availableSpaces.append(image)
                    availableImages.append(name)
                }
            }
            
            guard availableImages.count > 0 else { return }
            
            let randIndex = Int.random(in: 0 ..< availableSpaces.count)
            makeChoice(availableSpaces[randIndex])
            computerChoices.append(availableImages[randIndex])
          checkIfWon()
        }
    
    func checkIfWon() {
        var correct = [[Image]]()
        let firstRow: [Image] = [.one, .two, .three]
        let secondRow: [Image] = [.four, .five, .six]
        let thirdRow: [Image] = [.seven, .eight, .nine]
                
        let firstCol: [Image] = [.one, .four, .seven]
        let secondCol: [Image] = [.two, .five, .six]
        let thirdCol: [Image] = [.three, .six, .nine]
                
        let backwardSlash: [Image] = [.one, .five, .nine]
        let forwardSlash: [Image] = [.three, .five, .seven]
        
        correct.append(firstRow)
        correct.append(secondRow)
        correct.append(thirdRow)
        correct.append(firstCol)
        correct.append(secondCol)
        correct.append(thirdCol)
        correct.append(backwardSlash)
        correct.append(forwardSlash)
        
        for valid in correct {
                    let userMatch = playerChoices.filter { valid.contains($0) }.count
                    let computerMatch = computerChoices.filter { valid.contains($0) }.count
                    if userMatch == valid.count {
                        playerScoreLabel.text = String((Int(playerScoreLabel.text ?? "0") ?? 0) + 1)
                        playAgainButton.isHidden = false
                        winingPlayerLabel.isHidden = false
                        if let playerName = playerName {
                        winingPlayerLabel.text = "\(playerName) has Won!"
                        imagesUnclickable()
                        computerNoPlay()
                            
                        }
                        break
                    } else if computerMatch == valid.count {
                        computerScoreLabel.text = String((Int(computerScoreLabel.text ?? "0") ?? 0) + 1)
                        playAgainButton.isHidden = false
                        winingPlayerLabel.isHidden = false
                        winingPlayerLabel.text = "Computer has Won!"
                        imagesUnclickable()
                        break
                    } else if computerChoices.count + playerChoices.count == 9 {
                        playAgainButton.isHidden = false
                        winingPlayerLabel.isHidden = false
                        winingPlayerLabel.text = "It was a tie!"
                        imagesUnclickable()
                        break
                    }
                }
    }
    
    func computerNoPlay() {
        lastValue = "o"
            playerChoices = []
            computerChoices = []
        }

    func imagesUnclickable(){
        image1.isUserInteractionEnabled = false
        image2.isUserInteractionEnabled = false
        image3.isUserInteractionEnabled = false
        image4.isUserInteractionEnabled = false
        image5.isUserInteractionEnabled = false
        image6.isUserInteractionEnabled = false
        image7.isUserInteractionEnabled = false
        image8.isUserInteractionEnabled = false
        image9.isUserInteractionEnabled = false
    }
    func imagesClickable(){
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image5.isUserInteractionEnabled = true
        image6.isUserInteractionEnabled = true
        image7.isUserInteractionEnabled = true
        image8.isUserInteractionEnabled = true
        image9.isUserInteractionEnabled = true
    }
    
    func resetGame() {
            for name in Image.allCases {
                let box = getImage(from: name.rawValue)
                box.image = nil
            }
            lastValue = "o"
            playerChoices = []
            computerChoices = []
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
        
        UIView.animate(withDuration: 1.0, delay: 2.0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }) { (isCompleted) in
            toastLabel.removeFromSuperview()
        
    }
 }
    
    func makeChoice(_ selectedImage: UIImageView) {
            guard selectedImage.image == nil else { return }
            if lastValue == "x" {
                if let playerName = playerName{
                showPlayerTurnToast(message: "\(playerName)'s turn")
                }
                selectedImage.image = UIImage(named: "Yellow.png")
                lastValue = "o"
            } else {
                selectedImage.image = UIImage(named: "Red.png")
                lastValue = "x"
            }
        }
    
    func getImage(from name: String) -> UIImageView {
            let image10 = Image(rawValue: name) ?? .one
            
            switch image10 {
            case .one:
                return image1
            case .two:
                return image2
            case .three:
                return image3
            case .four:
                return image4
            case .five:
                return image5
            case .six:
                return image6
            case .seven:
                return image7
            case .eight:
                return image8
            case .nine:
                return image9
            }
        }
    enum Image: String, CaseIterable {
        case one, two, three, four, five, six, seven, eight, nine
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
