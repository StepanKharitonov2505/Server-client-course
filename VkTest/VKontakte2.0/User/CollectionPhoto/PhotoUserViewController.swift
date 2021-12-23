//
//  PhotoUserViewController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 09.12.2021.
//

import UIKit
import SDWebImage

class PhotoUserViewController: UIViewController {

    @IBOutlet weak var backPhotoInset: UIImageView!
    @IBOutlet weak var nextPhotoInset: UIImageView!
    @IBOutlet weak var selectItems: UILabel!
    @IBOutlet weak var numberItems: UILabel!
    @IBOutlet weak var photoInset: UIImageView!
    var visualEffectView: UIView?
    var userPhotoArray: [Photos]?
    var numberItemsOnArray: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurMotion()
    
        let photoRecognizerLeft = UISwipeGestureRecognizer()
        photoRecognizerLeft.addTarget(self, action: #selector(reviewPhoto(_:)))
        photoRecognizerLeft.direction = .left
        self.view.addGestureRecognizer(photoRecognizerLeft)
        
        let photoRecognizerRight = UISwipeGestureRecognizer()
        photoRecognizerRight.addTarget(self, action: #selector(reviewPhotoRight(_:)))
        photoRecognizerRight.direction = .right
        self.view.addGestureRecognizer(photoRecognizerRight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photoPreview()
    }
    
    //MARK: Blur
    func blurMotion() {
        let blurEffect = UIBlurEffect(style: .dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = self.view.frame
            self.view.addSubview(visualEffectView)
            self.view.sendSubviewToBack(visualEffectView)
            self.visualEffectView = visualEffectView
        visualEffectView.alpha = 0.9
    }
    
    //MARK: main Photo func
    func photoPreview() {
        let selectItem = userPhotoArray![numberItemsOnArray!.item]
        let photoInSizes = selectItem.sizes.last
        photoInset.sd_setImage(with: URL.init(string: photoInSizes!.url), completed: nil)
        photoInset.layer.opacity = 1
        let number = String(describing: (userPhotoArray?.count)!)
        numberItems.text = number
        selectItems.text = String(describing: ((numberItemsOnArray?.item)!+1))
    }
    
    //MARK:  swipe left
    @objc func reviewPhoto(_ recognizer: UISwipeGestureRecognizer) {
        if (numberItemsOnArray!.item+1) < userPhotoArray!.count {
        numberItemsOnArray?.item += 1
            animateLeftMoved()
            mainPhotoView()
            UIView.transition(
                with: self.selectItems,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: {
                self.selectItems.text = String(describing: ((self.numberItemsOnArray?.item)!+1))
                },
                completion: nil)
            UIView.transition(with: self.photoInset,
                              duration: 1,
                              options: .transitionCrossDissolve,
                              animations: {
                                  self.photoInset.layer.opacity = 0
                              },
                              completion: nil)
        }
    }
    
    func animateLeftMoved() {
        let offset = nextPhotoInset.bounds.width
        nextPhotoInset.transform = CGAffineTransform(translationX: offset, y: 0)
        let selectItem = userPhotoArray![numberItemsOnArray!.item]
        let photoInSizes = selectItem.sizes.last
        nextPhotoInset.sd_setImage(with: URL.init(string: photoInSizes!.url), completed: nil)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .transitionCrossDissolve,
                       animations: {
                           self.nextPhotoInset.transform = .identity
                       },
                       completion: {_ in self.nextPhotoInset.image = nil;
            self.viewWillAppear(true)
        })
    }
    
    func  mainPhotoView() {
        let animationMain = CABasicAnimation(keyPath: "transform.scale")
        animationMain.fromValue = 1
        animationMain.toValue = 0.8
        animationMain.duration = 1
        animationMain.fillMode = CAMediaTimingFillMode.backwards
        self.photoInset.layer.add(animationMain, forKey: nil)
    }
    
    //MARK: swipe right
    @objc func reviewPhotoRight(_ recognizer: UISwipeGestureRecognizer) {
        if (numberItemsOnArray!.item) > 0 {
        numberItemsOnArray?.item -= 1
            nextPhotoInset.image = self.photoInset.image
            self.photoInset.image = nil
            animateBackPhoto()
            sizeBackPhoto()
            UIView.transition(
                with: self.selectItems,
                duration: 0.5,
                options: [.transitionCrossDissolve],
                animations: {
                self.selectItems.text = String(describing: ((self.numberItemsOnArray?.item)!+1))
                },
                completion: nil)
            UIView.animateKeyframes(
                withDuration: 1,
                delay: 0,
                options: [],
                animations: {
                    UIView.addKeyframe(
                        withRelativeStartTime: 0,
                        relativeDuration: 1,
                        animations: {
                            self.nextPhotoInset.center.x = self.nextPhotoInset.bounds.height
                        })
                },
                completion: {_ in self.nextPhotoInset.image = nil; self.viewWillAppear(true)})
        }
    }
    
    func animateBackPhoto() {
        let selectItem = userPhotoArray![numberItemsOnArray!.item]
        let photoInSizes = selectItem.sizes.last
        backPhotoInset.sd_setImage(with: URL.init(string: photoInSizes!.url), completed: nil)
        //backPhotoInset.image = UIImage(named: selectItem.namePhotoUser)
        self.backPhotoInset.layer.opacity = 0
        UIView.transition(with: self.backPhotoInset,
                          duration: 1,
                          options: .transitionCrossDissolve,
                          animations: {
                             self.backPhotoInset.layer.opacity = 1
                          },
                          completion: {_ in self.backPhotoInset.image = nil})
    }
        
    func sizeBackPhoto() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.8
        animation.toValue = 1
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        self.backPhotoInset.layer.add(animation, forKey: nil)
    }
}

