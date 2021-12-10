//
//  CollectionPhotoController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.11.2021.
//

import UIKit

class CollectionPhotoController: UICollectionViewController {

    var isLiked: Bool?
    var avatarElement: UserFriendly?

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
    
        
        cell.PhotoFriends.image = UIImage(named: (avatarElement?.imagename.namePhotoUser)!)
        if UIImage(named: (avatarElement?.imagename.namePhotoUser)!) == nil {
            cell.PhotoFriends.image = UIImage(named: "PhotoNil")
        }
        cell.CollectionBackground.backgroundColor = UIColor.black
        cell.CollectionBackground.layer.cornerRadius = (cell.CollectionBackground.frame.height/15)
        cell.CollectionBackground.clipsToBounds = true
        cell.CollectionShadow.layer.cornerRadius = cell.CollectionBackground.layer.cornerRadius
        cell.CollectionShadow.layer.shadowColor = UIColor.link.cgColor
        cell.CollectionShadow.layer.shadowOpacity = 0.7
        cell.CollectionShadow.layer.shadowOffset = CGSize.zero
        cell.CollectionShadow.layer.shadowRadius = 5
        
        cell.likeView.layer.cornerRadius = cell.CollectionBackground.layer.cornerRadius
        cell.likeBackground.layer.cornerRadius = cell.likeView.layer.cornerRadius
        
        // MARK: Like in the photo
        
        guard let likeSave = isLiked else {
            return UICollectionViewCell()
        }
        // перезаписываю экземпляр класса UserFriendly
        avatarElement?.imagename.isLikedPhoto = likeSave
        if avatarElement?.imagename.isLikedPhoto == false {
            UIView.transition(
                with: cell.CollectionShadow,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {cell.CollectionShadow.layer.shadowColor = UIColor.link.cgColor},
                completion: nil )
            cell.likeNumber.text = "0"
            cell.likeNumber.textColor = UIColor.white
            cell.likeHeart.tintColor = UIColor.white
        } else {
            UIView.transition(
                with: cell.CollectionShadow,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {cell.CollectionShadow.layer.shadowColor = UIColor.yellow.cgColor},
                completion: nil )
            cell.likeNumber.text = "1"
            cell.likeNumber.textColor = UIColor.yellow
            cell.likeHeart.tintColor = UIColor.yellow
            cell.CollectionShadow.layer.shadowColor = UIColor.yellow.cgColor
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let previewVC = segue.destination as? UserPhotoCollection else {
            return
        }
        let userProfile = avatarElement
        previewVC.userElement = userProfile
    }

    // MARK: IBAction
    
    @IBAction func likeSelectedButton(_ sender: Any) {
       
        if isLiked == false {
            isLiked = true
            collectionView.reloadData()
        } else {
            isLiked = false
            collectionView.reloadData()
        }
        
    }
    
}
