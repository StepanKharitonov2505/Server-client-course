//
//  loadView.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 30.11.2021.
//

import UIKit

class loadView: UIView {

    override func draw(_ rect: CGRect) {
    super.draw(rect)
    // MARK:  Color Declarations
    let color = UIColor(red: 0.227, green: 0.293, blue: 0.356, alpha: 0.429)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 99.5, y: 71.5))
        bezierPath.addCurve(to: CGPoint(x: 115.17, y: 70.25), controlPoint1: CGPoint(x: 101.02, y: 69.22), controlPoint2: CGPoint(x: 110.93, y: 69.47))
        bezierPath.addCurve(to: CGPoint(x: 117.5, y: 71.5), controlPoint1: CGPoint(x: 116.5, y: 70.5), controlPoint2: CGPoint(x: 116.5, y: 70.5))
        bezierPath.addCurve(to: CGPoint(x: 119.5, y: 75.5), controlPoint1: CGPoint(x: 118.5, y: 72.5), controlPoint2: CGPoint(x: 119.5, y: 75.5))
        bezierPath.addCurve(to: CGPoint(x: 123.5, y: 86.5), controlPoint1: CGPoint(x: 119.5, y: 75.5), controlPoint2: CGPoint(x: 120.67, y: 80.67))
        bezierPath.addCurve(to: CGPoint(x: 129.5, y: 96.5), controlPoint1: CGPoint(x: 126.33, y: 92.33), controlPoint2: CGPoint(x: 129.5, y: 96.5))
        bezierPath.addCurve(to: CGPoint(x: 137.5, y: 104.5), controlPoint1: CGPoint(x: 129.5, y: 96.5), controlPoint2: CGPoint(x: 135, y: 104.25))
        bezierPath.addCurve(to: CGPoint(x: 139.5, y: 97.5), controlPoint1: CGPoint(x: 140, y: 104.75), controlPoint2: CGPoint(x: 139.5, y: 97.5))
        bezierPath.addCurve(to: CGPoint(x: 139.5, y: 84.5), controlPoint1: CGPoint(x: 139.5, y: 97.5), controlPoint2: CGPoint(x: 140, y: 89.5))
        bezierPath.addCurve(to: CGPoint(x: 137.5, y: 77.5), controlPoint1: CGPoint(x: 139, y: 79.5), controlPoint2: CGPoint(x: 137.5, y: 77.5))
        bezierPath.addCurve(to: CGPoint(x: 135.5, y: 74.5), controlPoint1: CGPoint(x: 137.5, y: 77.5), controlPoint2: CGPoint(x: 136, y: 76))
        bezierPath.addCurve(to: CGPoint(x: 135.5, y: 71.5), controlPoint1: CGPoint(x: 135, y: 73), controlPoint2: CGPoint(x: 135, y: 72.5))
        bezierPath.addCurve(to: CGPoint(x: 137.5, y: 70.5), controlPoint1: CGPoint(x: 136, y: 70.5), controlPoint2: CGPoint(x: 137.5, y: 70.5))
        bezierPath.addLine(to: CGPoint(x: 155.5, y: 70.5))
        bezierPath.addCurve(to: CGPoint(x: 157.5, y: 71.5), controlPoint1: CGPoint(x: 155.5, y: 70.5), controlPoint2: CGPoint(x: 156.75, y: 70.75))
        bezierPath.addCurve(to: CGPoint(x: 158.5, y: 73.5), controlPoint1: CGPoint(x: 158.25, y: 72.25), controlPoint2: CGPoint(x: 158.5, y: 73.5))
        bezierPath.addLine(to: CGPoint(x: 158.5, y: 96.5))
        bezierPath.addCurve(to: CGPoint(x: 160.5, y: 99.5), controlPoint1: CGPoint(x: 158.5, y: 96.5), controlPoint2: CGPoint(x: 158.75, y: 99.5))
        bezierPath.addCurve(to: CGPoint(x: 165.5, y: 96.5), controlPoint1: CGPoint(x: 162.25, y: 99.5), controlPoint2: CGPoint(x: 165.5, y: 96.5))
        bezierPath.addCurve(to: CGPoint(x: 174.5, y: 83.5), controlPoint1: CGPoint(x: 165.5, y: 96.5), controlPoint2: CGPoint(x: 171.25, y: 88.75))
        bezierPath.addCurve(to: CGPoint(x: 178.5, y: 75.5), controlPoint1: CGPoint(x: 177.75, y: 78.25), controlPoint2: CGPoint(x: 177, y: 78.5))
        bezierPath.addCurve(to: CGPoint(x: 180.5, y: 71.5), controlPoint1: CGPoint(x: 180, y: 72.5), controlPoint2: CGPoint(x: 179.25, y: 72.75))
        bezierPath.addCurve(to: CGPoint(x: 183.5, y: 70.5), controlPoint1: CGPoint(x: 181.75, y: 70.25), controlPoint2: CGPoint(x: 183.5, y: 70.5))
        bezierPath.addLine(to: CGPoint(x: 196.5, y: 70.5))
        bezierPath.addCurve(to: CGPoint(x: 198.5, y: 72.5), controlPoint1: CGPoint(x: 196.5, y: 70.5), controlPoint2: CGPoint(x: 198, y: 71.25))
        bezierPath.addCurve(to: CGPoint(x: 198.5, y: 75.5), controlPoint1: CGPoint(x: 199, y: 73.75), controlPoint2: CGPoint(x: 198.5, y: 75.5))
        bezierPath.addCurve(to: CGPoint(x: 191.5, y: 88.5), controlPoint1: CGPoint(x: 198.5, y: 75.5), controlPoint2: CGPoint(x: 195.25, y: 82.25))
        bezierPath.addCurve(to: CGPoint(x: 183.5, y: 100.5), controlPoint1: CGPoint(x: 187.75, y: 94.75), controlPoint2: CGPoint(x: 183.5, y: 100.5))
        bezierPath.addCurve(to: CGPoint(x: 182.5, y: 103.5), controlPoint1: CGPoint(x: 183.5, y: 100.5), controlPoint2: CGPoint(x: 182.5, y: 102.25))
        bezierPath.addCurve(to: CGPoint(x: 183.5, y: 105.5), controlPoint1: CGPoint(x: 182.5, y: 104.75), controlPoint2: CGPoint(x: 183.5, y: 105.5))
        bezierPath.addCurve(to: CGPoint(x: 193.5, y: 115.5), controlPoint1: CGPoint(x: 183.5, y: 105.5), controlPoint2: CGPoint(x: 189.25, y: 110.75))
        bezierPath.addCurve(to: CGPoint(x: 200.5, y: 124.5), controlPoint1: CGPoint(x: 197.75, y: 120.25), controlPoint2: CGPoint(x: 199.5, y: 122.5))
        bezierPath.addCurve(to: CGPoint(x: 200.5, y: 129.5), controlPoint1: CGPoint(x: 201.5, y: 126.5), controlPoint2: CGPoint(x: 201, y: 127.75))
        bezierPath.addCurve(to: CGPoint(x: 198.5, y: 131.5), controlPoint1: CGPoint(x: 200, y: 131.25), controlPoint2: CGPoint(x: 198.5, y: 131.5))
        bezierPath.addCurve(to: CGPoint(x: 184.5, y: 131.5), controlPoint1: CGPoint(x: 198.5, y: 131.5), controlPoint2: CGPoint(x: 186.5, y: 131.5))
        bezierPath.addCurve(to: CGPoint(x: 180.5, y: 128.5), controlPoint1: CGPoint(x: 182.5, y: 131.5), controlPoint2: CGPoint(x: 180.5, y: 128.5))
        bezierPath.addCurve(to: CGPoint(x: 171.5, y: 118.5), controlPoint1: CGPoint(x: 180.5, y: 128.5), controlPoint2: CGPoint(x: 175.75, y: 122.25))
        bezierPath.addCurve(to: CGPoint(x: 163.5, y: 113.5), controlPoint1: CGPoint(x: 167.25, y: 114.75), controlPoint2: CGPoint(x: 166.5, y: 114.5))
        bezierPath.addCurve(to: CGPoint(x: 159.5, y: 113.5), controlPoint1: CGPoint(x: 160.5, y: 112.5), controlPoint2: CGPoint(x: 159.5, y: 113.5))
        bezierPath.addCurve(to: CGPoint(x: 158.5, y: 115.5), controlPoint1: CGPoint(x: 159.5, y: 113.5), controlPoint2: CGPoint(x: 158.5, y: 114.5))
        bezierPath.addCurve(to: CGPoint(x: 158.5, y: 126.5), controlPoint1: CGPoint(x: 158.5, y: 116.5), controlPoint2: CGPoint(x: 158.5, y: 126.5))
        bezierPath.addCurve(to: CGPoint(x: 157.5, y: 129.5), controlPoint1: CGPoint(x: 158.5, y: 126.5), controlPoint2: CGPoint(x: 158.5, y: 128.25))
        bezierPath.addCurve(to: CGPoint(x: 154.5, y: 131.5), controlPoint1: CGPoint(x: 156.5, y: 130.75), controlPoint2: CGPoint(x: 155.5, y: 131.5))
        bezierPath.addCurve(to: CGPoint(x: 147.5, y: 131.5), controlPoint1: CGPoint(x: 153.5, y: 131.5), controlPoint2: CGPoint(x: 149.5, y: 131.5))
        bezierPath.addCurve(to: CGPoint(x: 137.5, y: 128.5), controlPoint1: CGPoint(x: 145.5, y: 131.5), controlPoint2: CGPoint(x: 142.5, y: 130.75))
        bezierPath.addCurve(to: CGPoint(x: 127.5, y: 122.5), controlPoint1: CGPoint(x: 132.5, y: 126.25), controlPoint2: CGPoint(x: 132.25, y: 126.25))
        bezierPath.addCurve(to: CGPoint(x: 118, y: 113), controlPoint1: CGPoint(x: 122.75, y: 118.75), controlPoint2: CGPoint(x: 121.75, y: 117.5))
        bezierPath.addCurve(to: CGPoint(x: 112, y: 105), controlPoint1: CGPoint(x: 114.25, y: 108.5), controlPoint2: CGPoint(x: 115, y: 109.75))
        bezierPath.addCurve(to: CGPoint(x: 106.5, y: 94.5), controlPoint1: CGPoint(x: 109, y: 100.25), controlPoint2: CGPoint(x: 109.5, y: 100.5))
        bezierPath.addCurve(to: CGPoint(x: 100.5, y: 80.5), controlPoint1: CGPoint(x: 103.5, y: 88.5), controlPoint2: CGPoint(x: 100.5, y: 80.5))
        bezierPath.addCurve(to: CGPoint(x: 99.5, y: 71.5), controlPoint1: CGPoint(x: 100.5, y: 80.5), controlPoint2: CGPoint(x: 97.5, y: 74.5))
        bezierPath.close()
        color.setStroke()
        bezierPath.lineWidth = 8
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
        bezierPath.stroke()

        
        let layerLineSpeed = CAShapeLayer()
                // Color
        layerLineSpeed.strokeColor = UIColor(red: 0.200, green: 0.612, blue: 1.000, alpha: 1.000).cgColor
                layerLineSpeed.fillColor = UIColor.clear.cgColor
                layerLineSpeed.opacity = 1
                // Width line
                layerLineSpeed.lineWidth = 8
                // Cap line
                layerLineSpeed.lineCap = .round
                //
        layerLineSpeed.shadowColor = UIColor.blue.cgColor
        layerLineSpeed.shadowRadius = 5
        layerLineSpeed.shadowOffset = CGSize.zero
        layerLineSpeed.shadowOpacity = 0.7
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeEnd")
             strokeStartAnimation.fromValue = 0
             strokeStartAnimation.toValue = 1
        strokeStartAnimation.duration = 3.5
             layerLineSpeed.path = bezierPath.cgPath
             layerLineSpeed.add(strokeStartAnimation, forKey: nil)
             self.layer.addSublayer(layerLineSpeed)
    }
}
