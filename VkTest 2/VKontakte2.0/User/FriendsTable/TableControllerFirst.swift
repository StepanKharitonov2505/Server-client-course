//
//  TableControllerFirst.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.11.2021.
//

import UIKit
import RealmSwift
import SDWebImage

final class TableControllerFirst: UITableViewController {
    
  
    @IBOutlet weak var tableViewFriends: UITableView!
    
    let headerID = String(describing: HeaderFriends.self)
    
    // MARK: API
    private var friendsAPI = FriendsApiMethods()
    private var friendsAPIArray: [ModelFriendsManual] = []
    var firstCharFriendsAPI = [String]()
    var dictionaryFriendsAPI = [String : [ModelFriendsManual]]()
    
    // MARK: Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfig()
        friendsAPI.getFriends { [weak self] in
            guard let self = self else { return }
            
            self.loadFriendsData()
            self.uploadFirstCharFriendsAPI()
            self.uploadKeyDictionaryFriendsAPI()
            self.uploadValueDictionaryFriendsAPI()
            self.tableViewFriends.reloadData()
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstCharFriendsAPI.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let describingValue = firstCharFriendsAPI[section]
        let numberRows = dictionaryFriendsAPI[describingValue]
        return numberRows!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? TableCellControllerFirst else {
            return UITableViewCell()
        }
        
        // MARK: Link to the dictionary
        
        let keyLetter = firstCharFriendsAPI[indexPath.section]
        let arrayFriendsRows = dictionaryFriendsAPI[keyLetter]
        
        // MARK: Name
    
        let friends1 = arrayFriendsRows?[indexPath.row]
        cell.numberOfItems.text = "0"
        cell.cellFriends.text = friends1?.firstName
                if cell.cellFriends.text == "" {
                    cell.cellFriends.text = "имя отсутствует"
                }
    
        // MARK: Surname
        
        cell.cellSurname.text = friends1?.lastName
                if cell.cellSurname.text == "" {
                    cell.cellSurname.text = "фамилия отсутствует"
                }
                cell.photoFriends.layer.cornerRadius = cell.photoFriends.frame.height/2
                cell.photoFriends.contentMode = .scaleAspectFill

        cell.photoFriends.sd_setImage(with: URL.init(string: friends1!.photoMaxOrig), completed: nil)
        
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
            let indexSegue = seguePath.firstCharFriendsAPI[newIndex.section]
            let indexSection = dictionaryFriendsAPI[indexSegue]
            let indexPhotoRow = indexSection?[newIndex.row]
            photoVC.selectUserAPI = indexPhotoRow
        }
    }
    
    // MARK: Header and Footer
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableViewFriends.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? HeaderFriends else {
            return UIView()
        }
        header.headerFriendsSection.textColor = .gray
        header.headerFriendsSection.text = firstCharFriendsAPI[section]
        header.tintColor = UIColor.black
       
            return header
        }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    // MARK: API header func
    
    func uploadFirstCharFriendsAPI() {
        var n = 0
        while n < friendsAPIArray.count {
            let firstCharIndex = friendsAPIArray[n].firstName.index(friendsAPIArray[n].firstName.startIndex, offsetBy: 1)
            let firstChar = String(friendsAPIArray[n].firstName[..<firstCharIndex])
            if !firstCharFriendsAPI.contains(firstChar) {
                firstCharFriendsAPI.append(firstChar)
                n += 1
            } else {
            n += 1
            }
        }
    }
    
    func uploadKeyDictionaryFriendsAPI() {
           var n = 0
           while n < firstCharFriendsAPI.count {
               dictionaryFriendsAPI[firstCharFriendsAPI[n]] = [ModelFriendsManual]()
               n += 1
           }
       }
    
    func uploadValueDictionaryFriendsAPI() {
        var n = 0
        while n < friendsAPIArray.count {
            let firstCharIndex = friendsAPIArray[n].firstName.index(friendsAPIArray[n].firstName.startIndex, offsetBy: 1)
            let firstChar = String(friendsAPIArray[n].firstName[..<firstCharIndex])
            dictionaryFriendsAPI[firstChar]! += [friendsAPIArray[n]]
            n += 1
        }
    }
    
    //MARK: Realm module
    func loadFriendsData() {
        do {
            let realm = try Realm()
            let friendsData = realm.objects(ModelFriendsManual.self)
            self.friendsAPIArray = Array(friendsData)
        } catch  {
            print(error)
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
    
    @IBAction func refreshButton(_ sender: Any) {
        self.viewDidLoad()
    }
}
