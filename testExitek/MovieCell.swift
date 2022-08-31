//
//  MovieCell.swift
//  testExitek
//
//  Created by Vlad Rakovich on 31.08.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var itemMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
