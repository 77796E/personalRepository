//
//  DetailCell.swift
//  weather_demo
//
//  Created on 2022/2/24.
//

import UIKit

class DetailCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherTextLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
