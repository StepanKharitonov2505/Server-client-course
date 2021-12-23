//
//  UserPhotoCollection.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.12.2021.
//

import UIKit
import SDWebImage

class UserPhotoCollection: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var userID: Int?
    private var photosAPI = PhotosApiMethods()
    private var photosAPIArray: [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosAPI.photosGetAll(friendsId: userID!, completion: {[weak self] photosAPIArray in
            guard let self = self else { return }
            
            self.photosAPIArray = photosAPIArray
            self.collectionView.reloadData()
        })
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosAPIArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userPhotoID", for: indexPath) as? UserPhotoCell else {
            return UICollectionViewCell()
        }
        
        let photoPath = photosAPIArray[indexPath.item]
        let photoInSizes = photoPath.sizes.last
        
        cell.photo.sd_setImage(with: URL.init(string: photoInSizes!.url), completed: nil)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "photoPreview" {
              guard let photoVC = segue.destination as? PhotoUserViewController else {
                  return
              }
              let indexPathSeceltCell = self.collectionView.indexPathsForSelectedItems?.first
              photoVC.userPhotoArray = photosAPIArray
              photoVC.numberItemsOnArray = indexPathSeceltCell
          }
      }
    
    // MARK: Layout Cell

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = (self.view.frame.width-6)/3
        return CGSize(width: layout, height: layout)
    }
    
  

}
