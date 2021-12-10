//
//  TipInCellAnimator.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 25.11.2021.
//

import UIKit

class TipInCellAnimator{
//    class func twoAnimate(cell: UITableViewCell) {
//          let view = cell.contentView
//          view.layer.opacity = 0.1
//            UIView.animate(withDuration: 1) {
//            view.layer.opacity = 1
//          }
//        }
    class func animate(cell: UITableViewCell) {
              let view = cell.contentView
              let rotationDegrees: CGFloat = -30.0
              let rotationRadians: CGFloat = rotationDegrees * (.pi/180.0)
              let offset = CoreGraphics.CGPoint(x: 150, y: 150)
              var startTransform = CATransform3DIdentity
              startTransform = CATransform3DRotate(CATransform3DIdentity,
                rotationRadians, 0.0, 0.0, 1.0)
              startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
        
              view.layer.transform = startTransform
              view.layer.opacity = 0.8
        
        UIView.animate(withDuration: 0.8) {
                view.layer.transform = CATransform3DIdentity
                view.layer.opacity = 1
              }
        }
}
