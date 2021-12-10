//
//  PhotoUserViewController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.12.2021.
//

import UIKit

class PhotoUserViewController: UIViewController {

    @IBOutlet weak var photoInset: UIImageView!
    var visualEffectView: UIView?
    var userPhotoArray: [PhotoArray]?
    var numberItemsOnArray: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurMotion()
        photoPreview()
        let photoRecognizer = UISwipeGestureRecognizer()
        photoRecognizer.addTarget(self, action: #selector(reviewPhoto(_:)))
        view.addGestureRecognizer(photoRecognizer)
    }
    
    func blurMotion() {
        let blurEffect = UIBlurEffect(style: .dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = self.view.frame
            self.view.addSubview(visualEffectView)
            self.view.sendSubviewToBack(visualEffectView)
            self.visualEffectView = visualEffectView
        visualEffectView.alpha = 0.9
    }
    
    func photoPreview() {
          let selectItem = userPhotoArray![numberItemsOnArray!.item]
          photoInset.image = UIImage(named: selectItem.namePhotoUser)
    }
    
    @objc func reviewPhoto(_ recognizer: UISwipeGestureRecognizer) {
//        switch recognizer.state {
//        case .ended :
//        case .changed :
//        case .possible :
//        case .ended :
//        default : return
//        }
    }
}
