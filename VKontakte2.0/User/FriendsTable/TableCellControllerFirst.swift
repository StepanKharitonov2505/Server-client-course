//
//  TableCellControllerFirst.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.11.2021.
//

import UIKit

class TableCellControllerFirst: UITableViewCell {

    @IBOutlet weak var numberOfItems: UILabel!
    @IBOutlet weak var cellSurname: UILabel!
    @IBOutlet weak var myGradientView: UIView!
    @IBOutlet weak var photoFriends: UIImageView!
    @IBOutlet weak var cellFriends: UILabel!
    @IBOutlet weak var myShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
