//
//  SearchShoeCell.swift
//  iOS-Group-Project
//
//  Created by student on 5/2/22.
//

import UIKit

class SearchShoeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
       
    }
    
    @IBOutlet weak var shoeImg: UIImageView!
    
    @IBOutlet weak var shoeName: UILabel!
    
    @IBOutlet weak var shoeBrand: UILabel!
    
    @IBOutlet weak var shoeYear: UILabel!

}
