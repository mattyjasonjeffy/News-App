//
//  NewsCell.swift
//  NewsApp
//
//  Created by Matthew Nguyen on 5/23/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func SaveArticle(_ sender: Any) {
        var dict = UserDefaults.standard.object(forKey: "savedNews") as? [String: String] ?? [String: String]()
        dict[(titleLabel.text)!] = descriptionLabel.text
        UserDefaults.standard.set(dict, forKey: "savedNews")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
