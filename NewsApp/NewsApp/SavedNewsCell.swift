//
//  SavedNewsCell.swift
//  NewsApp
//
//  Created by Jeffy Touth on 5/31/21.
//

import UIKit

class SavedNewsCell: UITableViewCell {
    @IBOutlet weak var savedNewsLabel: UILabel!
    @IBOutlet weak var savedNewsDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
