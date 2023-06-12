//
//  CardListCell.swift
//  ios-credit-card-list
//
//  Created by 허지인 on 2021/11/17.
//

import UIKit
import QuartzCore

class CardListCell: UITableViewCell {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.promotionLabel.layer.cornerRadius = 8
        self.promotionLabel.layer.masksToBounds = true
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
