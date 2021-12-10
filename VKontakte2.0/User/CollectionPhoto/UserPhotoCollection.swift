//
//  UserPhotoCollection.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.12.2021.
//

import UIKit

class UserPhotoCollection: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var userElement: UserFriendly?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (userElement?.pictureCollection.count)! 
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userPhotoID", for: indexPath) as? UserPhotoCell else {
            return UICollectionViewCell()
        }
        
        let photoPath = userElement?.pictureCollection[indexPath.item]
      
        cell.photo.image = UIImage(named: photoPath!.namePhotoUser)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "photoPreview" {
              guard let photoVC = segue.destination as? PhotoUserViewController else {
                  return
              }
              let indexPathSeceltCell = self.collectionView.indexPathsForSelectedItems?.first
              photoVC.userPhotoArray = userElement?.pictureCollection as? [PhotoArray]
              photoVC.numberItemsOnArray = indexPathSeceltCell
          }
      }
    
    // MARK: Layout Cell

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = (self.view.frame.width-6)/3
        return CGSize(width: layout, height: layout)
    }
    
  

}
