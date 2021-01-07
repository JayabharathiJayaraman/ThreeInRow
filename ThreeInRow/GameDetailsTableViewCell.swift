//
//  GameDetailsTableViewCell.swift
//  ThreeInRow
//
//  Created by Jayabharathi Jayaraman on 2021-01-05.
//

import UIKit

class GameDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var player1Choice: UIImageView!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player2Choice: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
