//
//  TableControllerFirst.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.11.2021.
//

import UIKit

class TableControllerFirst: UITableViewController {
    
    @IBOutlet weak var tableViewFriends: UITableView!
    var friends = UserRepository()
    var firstCharFriends = [String]()
    var dictionaryFriends = [String : [UserFriendly]]()
    let headerID = String(describing: HeaderFriends.self)
    
    // MARK: Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends.userBlock.sort()
        uploadFirstCharFriends()
        uploadKeyDictionaryFriends()
        uploadValueDictionaryFriends()
        tableViewConfig()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstCharFriends.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let describingValue = firstCharFriends[section]
        let numberRows = dictionaryFriends[describingValue]
        return numberRows!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? TableCellControllerFirst else {
            return UITableViewCell()
        }
        
        // MARK: Link to the dictionary
        
        let keyLetter = firstCharFriends[indexPath.section]
        let arrayFriendsRows = dictionaryFriends[keyLetter]
        
        
    
        // MARK: Name
    
        let friends1 = arrayFriendsRows?[indexPath.row]
        cell.numberOfItems.text = String(describing: (friends1?.pictureCollection.count)!)
                cell.cellFriends.text = friends1?.name
                if cell.cellFriends.text == "" {
                    cell.cellFriends.text = "имя отсутствует"
                }
                
        // MARK: Surname
        
                cell.cellSurname.text = friends1?.surname
                if cell.cellSurname.text == "" {
                    cell.cellSurname.text = "фамилия отсутствует"
                }
                cell.photoFriends.layer.cornerRadius = cell.photoFriends.frame.height/2
                cell.photoFriends.contentMode = .scaleAspectFill
                cell.photoFriends.image = UIImage(named: (friends1?.imagename.namePhotoUser)!)
                if UIImage(named: (friends1?.imagename.namePhotoUser)!) == nil {
                    cell.photoFriends.image = UIImage(named: "PhotoNil")
                }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.photoFriends.isUserInteractionEnabled = true
        cell.photoFriends.addGestureRecognizer(tapGestureRecognizer)
        
        // MARK: Shadow
                
                cell.myShadowView.backgroundColor = .darkGray
                cell.myShadowView.layer.cornerRadius = cell.photoFriends.layer.cornerRadius
                cell.myShadowView.clipsToBounds = false
                cell.myShadowView.layer.shadowColor = UIColor.link.cgColor
                cell.myShadowView.layer.shadowOpacity = 0.7
                cell.myShadowView.layer.shadowOffset = CGSize.zero
                cell.myShadowView.layer.shadowRadius = 5
        
        // MARK: Gradient
        
                let myGradient = CAGradientLayer()
                myGradient.colors = [UIColor.purple.cgColor, UIColor.black.cgColor]
                myGradient.locations = [ 0 as NSNumber, 0.4 as NSNumber]
                myGradient.startPoint = CGPoint.init(x: 1, y: 1)
                myGradient.endPoint = CGPoint(x: 0.0, y: 1.0)
                cell.myGradientView.layer.insertSublayer(myGradient, at: 0)
                myGradient.frame = cell.myGradientView.bounds
                myGradient.opacity = 0.3
        
                UIView.animate(withDuration: 0.55, animations: {cell.bounds.size = CGSize.init(width: 0, height: cell.bounds.height)})
             
        
        return cell
    }
    
    // MARK: Prepare methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? CollectionPhotoController else {
            return
        }
        guard let seguePath = segue.source as? TableControllerFirst else {
            return
        }
        if let newIndex = seguePath.tableView.indexPathForSelectedRow {
            let indexSegue = seguePath.firstCharFriends[newIndex.section]
            let indexSection = dictionaryFriends[indexSegue]
            let indexPhotoRow = indexSection?[newIndex.row]
            photoVC.avatarElement = indexPhotoRow
            photoVC.isLiked = indexPhotoRow?.imagename.isLikedPhoto
        }
    }
    
    // MARK: Header and Footer
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableViewFriends.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? HeaderFriends else {
            return UIView()
        }
        header.headerFriendsSection.textColor = .gray
        header.headerFriendsSection.text = firstCharFriends[section]
        header.tintColor = UIColor.black
       
            return header
        }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    // MARK: func for var/let
    
    func uploadFirstCharFriends() {
        var n = 0
        while n < friends.userBlock.count {
        let firstCharIndex = friends.userBlock[n].name.index(friends.userBlock[n].name.startIndex, offsetBy: 1)
        let firstChar = String(friends.userBlock[n].name[..<firstCharIndex])
            if !firstCharFriends.contains(firstChar) {
                firstCharFriends.append(firstChar)
                n += 1
            } else {
            n += 1
            }
        }
    }
    
    func uploadKeyDictionaryFriends() {
        var n = 0
        while n < firstCharFriends.count {
            dictionaryFriends[firstCharFriends[n]] = [UserFriendly]()
            n += 1
        }
    }
    
    func uploadValueDictionaryFriends() {
        var n = 0
        while n < friends.userBlock.count {
            let firstCharIndex = friends.userBlock[n].name.index(friends.userBlock[n].name.startIndex, offsetBy: 1)
            let firstChar = String(friends.userBlock[n].name[..<firstCharIndex])
            dictionaryFriends[firstChar]! += [friends.userBlock[n]]
            n += 1
        }
    }
    
    // MARK: Private func , register Header
    
    private func tableViewConfig() {
        let nib = UINib(nibName: headerID, bundle: nil)
        tableViewFriends.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
        tableViewFriends.tableFooterView = UIView()
    }

    // MARK: @Objc
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
        {
            guard let tappedImage = tapGestureRecognizer.view as? UIImageView else {
                return
            }
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    tappedImage.layer.cornerRadius = tappedImage.frame.height/2
                    tappedImage.bounds.size = CGSize(width: 85, height: 85)
                },
                completion: nil)
        }
}
