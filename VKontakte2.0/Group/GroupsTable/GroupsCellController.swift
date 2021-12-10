//
//  GroupsCellController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 10.11.2021.
//

import UIKit

class GroupsCellController: UITableViewCell {

    @IBOutlet weak var myGroupsCell: UILabel!
    @IBOutlet weak var myImageGroupsCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
