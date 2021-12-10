//
//  NewsCustomCell.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 24.11.2021.
//

import UIKit

class NewsCustomCell: UITableViewCell {
    // MARK: Tap on group Avatar
    
    
    // MARK: UIView Outlet
    @IBOutlet weak var shadowViewAvatarGroup: UIView!
    @IBOutlet weak var textAndLikeView: UIView!
    @IBOutlet weak var mainNewsView: UIView!
    // MARK: UIImageView Outlet
    @IBOutlet weak var avatarGroup: UIImageView!
    @IBOutlet weak var newsImageView: UIImageView!
    // MARK: UILabel Outlet
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var datePublishing: UILabel!
    @IBOutlet weak var newsTextContent: UILabel!
    @IBOutlet weak var timePublishing: UILabel!
    @IBOutlet weak var themePublishing: UILabel!
    @IBOutlet weak var viewsUsers: UILabel!
    @IBOutlet weak var likeNumber: UILabel!
    @IBOutlet weak var commentNumber: UILabel!
    @IBOutlet weak var shareNumber: UILabel!
    // MARK: Button
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonDown: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
