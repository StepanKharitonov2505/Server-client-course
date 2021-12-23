//
//  CollectionPhotoController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.11.2021.
//

import UIKit

class CollectionPhotoController: UICollectionViewController {

    var selectUserAPI: Friends?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoFriendsSegue", for: indexPath) as? PhotoCellCollection else {
            return UICollectionViewCell()
        }
            
        cell.PhotoFriends.sd_setImage(with: URL.init(string: selectUserAPI!.photoMaxOrig), completed: nil)
        
        cell.CollectionBackground.backgroundColor = UIColor.black
        cell.CollectionBackground.layer.cornerRadius = (cell.CollectionBackground.frame.height/15)
        cell.CollectionBackground.clipsToBounds = true
        cell.CollectionShadow.layer.cornerRadius = cell.CollectionBackground.layer.cornerRadius
        cell.CollectionShadow.layer.shadowColor = UIColor.link.cgColor
        cell.CollectionShadow.layer.shadowOpacity = 0.7
        cell.CollectionShadow.layer.shadowOffset = CGSize.zero
        cell.CollectionShadow.layer.shadowRadius = 5
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let previewVC = segue.destination as? UserPhotoCollection else {
            return
        }
        let userProfile = selectUserAPI
        previewVC.userID = userProfile?.id
    }
    
}
